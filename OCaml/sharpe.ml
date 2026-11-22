(* This file will contain the final calculation in order to create the sharpe ratio *)

let tickers = ["AMT";"CAT";"GOOGL";"HD"]
let numerator = 
  (RpAll.portfolio_expected_return tickers) -. (Rf.calculate_Rf)
