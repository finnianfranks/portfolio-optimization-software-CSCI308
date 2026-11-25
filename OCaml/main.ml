let () = 
  print_string "enter the size of the portfolio you would like to evaluate: ";
  let size = int_of_string (read_line ()) in
  let groups = Combinatorics.combinations size in
  let ratios = List.map (fun x -> Sharpe.sharpe x) groups in
  (* helper function goes here *)