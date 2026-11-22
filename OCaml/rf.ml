(* we calculate a risk free rate based on monthly annualized yields *)

(* load in risk free rate data *)
let data = Csv.load "./GS1M.csv"
(* clean up the data by making a usable list *)
let populated_list =
  let data_points = ref [] in 
  List.iteri (fun i x -> if i > 0 then (
    let data_point = float_of_string (List.nth x 1) in
    data_points := data_point :: !data_points
  )) data;
  !data_points

(* for this calculation we use 60 * 12 * 100 = 72000, since we must avg
the monthly yields, there are 60 months, then we must anualize, there are 12 months in a year,
and finally we must turn percent into decimal so divide by 100 *)
let calculate_Rf = 
  List.fold_left (fun acc x -> acc +. (x /. 72000.0)) 0.0 populated_list
