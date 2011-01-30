open Batteries_uni
open Printf
open Sys (* argv *)

let _ =
   if Array.length argv < 3 then
      failwith (sprintf "usage: %s count <0|1|2>" argv.(0));
   let count = int_of_string argv.(1)
   and benchtype = int_of_string argv.(2) in
   let resulting_list () =
      let rec f i l =
         if i <= 1 then l
         else f (i - 1) (i :: l)
      in
      f (count + 1) []
   in
   let f x = x + 1 in
   let incs = 
      match benchtype with
      | 0 -> 1 -- count |> Enum.map f |> List.of_enum
      | 1 -> 1 -- count |> List.of_enum |> List.map f
      | 2 -> resulting_list ()
      | _   -> failwith "no such bench type"
   in
   ignore incs

(* vim: set ts=3 sw=3 tw=80 : *)
