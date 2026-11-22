(* To find Rp:
1. calculate each stocks monthly return
2. calcule portfolios monthly return 
3. average the 60 monthly portfolio returns
  i. so do step 2 for every month and then average those results
4. *)

(* this file will only find the average monthly return for an individual stock *)

(* load our CSV file *)
let data = Csv.load "./monthly_prices.csv"

(* now I have a list of lists of strings. I can use regular list methods to manipulate data *)

(* get the index of the target ticker *)
let first = List.hd data 
let index_of target =
  List.find_mapi (fun i x -> if x = target then Some i else None) (first)

(* start calculation *)
(* we add the monthly returns to a list *)
let add_returns target = 
  let column = Option.get (index_of target) in
  let previous = ref (float_of_string (List.nth (List.nth data 1) column)) in
  let monthly_returns = ref [] in
  
  List.iteri (fun i x -> if i > 1
  then (
    let current = float_of_string (List.nth x column) in
    monthly_returns := ((current -. !previous) /. !previous) :: !monthly_returns;
    previous := current
  )
  ) data;
  List.rev !monthly_returns

  (* finally, calculate average monthly returns *)
  let avg_monthly_returns target =
    let returns = add_returns target in
    let sum = List.fold_left (+.) 0.0 returns in
    sum /. 60.0
 
