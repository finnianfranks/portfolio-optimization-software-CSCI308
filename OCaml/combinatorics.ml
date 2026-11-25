(* Ok I found this interesting library which allows me to do combinatorics. I will have to run an iterator over the different combinations
of stocks. It will take all the stocks, the size k I want each group, and iterate over that list of lists. The function applied to those 
subgroups should probably add the corrosponding sharpe rations to a mutable list. *)
let tickers = ["Date";"AMT";"CAT";"GOOGL";"HD";"JNJ";"JPM";"MSFT";"NEE";"PG";"XOM"]
let combinations size = 
  let groups = ref [] in
  Combinat.compositions ~n:(List.length tickers) ~k:size (fun x -> 
    let x_list = Array.to_list x in
    groups := x_list :: !groups
    );
  !groups


