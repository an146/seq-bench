open Batteries_uni
open Printf
open Sys (* argv *)

let _ =
   if Array.length argv < 3 then
      failwith (sprintf "usage: %s count listify_first" argv.(0));
   let count = int_of_string argv.(1)
   and listify_first = int_of_string argv.(2) in
   let items = (1 -- count) in
   let f x = x + 1 in
   let incs = 
      if listify_first > 0 then
         items |> List.of_enum |> List.map f
      else
         items |> Enum.map f |> List.of_enum
   in
   ignore incs

(* vim: set ts=3 sw=3 tw=80 : *)
