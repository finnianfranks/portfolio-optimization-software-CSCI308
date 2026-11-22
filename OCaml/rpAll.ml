(* there will be a list of tickers input *)
(* let tickers = [...] *)

(* we use the functions built in rp1.ml to calculate the total portfolios expected returns *)
let portfolio_expected_return tickers = 
  let tickers_monthly = List.map (fun x -> Rp1.avg_monthly_returns x) tickers in
  let weight = 1.0 /. (float_of_int (List.length tickers)) in
  List.fold_left (fun acc x -> acc +. (weight *. x)) 0.0 tickers_monthly