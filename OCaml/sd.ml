(* to calculate our standard deviation we are going to find the 
sample variance and then take the squre root. Lookup the formula for sample
variance and note that it is the one we are familiar with from statistical
inference theory *)

(* if we think about the form of sample variance, the mean we use will 
  be our portfolios expected returns (we have already calculate that) 
and each data point is the portfolios returns that month-which is the sum 
of the weighted returns of each ticker in that month. There are 60 months 
so we would divide that summation by 60-1=59. We would sum these results over all
60 months and there we have the sample variance *)

(* the first serious step we must take is calculating the portolios returns for each month *)

(* there are 60 months and I have to calculate each month's average returns so I want to use a list 
which has 60 entries, each one being that months average returns of the portfolio *)

(* start by importing the data *)
let data = Csv.load "./monthly_prices.csv"



(* helper function *)
let individual_return curr prev = (curr -. prev) /. prev
(* calculate the returns for any given month *)
let portfolio_monthI_returns tickers num_month =
  
  (* relevent ticker indexes, a list of int's *)
  let ticker_indexes  = 
    (* get the head of the data which contains the tickers *)
    let head = List.hd data in
    (* iterate over tickers, get their indexes *)
    let indexes = ref [] in
    List.iter (fun x -> indexes := Option.get (List.find_index (fun y -> y = x) head) :: !indexes) tickers;
    List.rev !indexes in
  let weight = float_of_int (List.length tickers) in
  let curr_month = List.nth data (num_month) in
  let prev_month = List.nth data (num_month-1) in
  
  
  List.fold_left (fun a b -> a +. (b /. weight)) (0.0) (List.map (fun x -> 
    let curr = float_of_string (List.nth curr_month x) in
    let prev = float_of_string (List.nth prev_month x) in
    individual_return curr prev) ticker_indexes)

(* now that I have each individual months return I should be able to write the summation *)
(* I'm learning that it appears helper functions in Ocaml don't serve a huge purpose. 
I't's almost more productive to wrap everything into one large function *)

let summation tickers = 
  (* set up a squaring function *)
  let square x = x *. x in
  let before_sum = List.map (fun w -> portfolio_monthI_returns tickers (w + 2)) (List.init 60 (fun x -> x)) in
  let avg = RpAll.portfolio_expected_return tickers in
  List.fold_left (fun acc x -> acc +. square (x -. avg)) 0.0 before_sum

let denom tickers =
  sqrt (summation tickers /. 59.0)