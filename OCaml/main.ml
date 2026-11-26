let () = 
  print_string "enter the size of the portfolio you would like to evaluate: ";
  let size = int_of_string (read_line ()) in
  let groups = Combinatorics.combinations size in
  let ratios = List.map (fun x -> Sharpe.sharpe x) groups in
  (* helper function goes here *)
  let highest_sharpe_ratio = List.nth groups (Find_max_i.find_max ratios) in
  Printf.printf "The highest monthly sharpe ratio of size %d comes from the portfolio of " size;
  print_newline () ;
  List.iter (fun x -> print_endline x) highest_sharpe_ratio;
  print_endline "it had a monthly sharpe ratio of: ";
  let best_ratio = Sharpe.sharpe highest_sharpe_ratio in
  Printf.printf "%f" best_ratio;
  print_newline ()


