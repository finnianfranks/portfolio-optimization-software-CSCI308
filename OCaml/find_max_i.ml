(* I want to challenge myself by writing a helper function which returns the index of the maximum entry in a list. I want to do this using principles of functional rather than imperative programming *)
let find_max ratios =
  let max = List.fold_left max min_float ratios in
  Option.get (List.find_index (fun x -> x = max) ratios)