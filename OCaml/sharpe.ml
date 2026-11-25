(* This file will contain the final calculation in order to create the sharpe ratio *)

let tickers = ["AMT";"CAT";"GOOGL";"HD"]
let numerator = 
  (RpAll.portfolio_expected_return tickers) -. (Rf.calculate_Rf)

let denominator = Sd.denom tickers
(* sharpe is the numberator over the denominator. This function will have to be refactored to 
take tickers as a parameter at some point *)
let sharpe = numerator /. denominator