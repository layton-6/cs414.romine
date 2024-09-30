(* William Romine *)
(* 00103649 *)
(* Dr. Lewis CS414 *)
(* https://rosettacode.org/wiki/Priority_queue#OCaml *)

type 'a priority_queue =
  | Empty
  | Node of 'a * int * 'a priority_queue list

let insert x p queue =
  let rec insert' queue =
    match queue with
    | Empty -> Node (x, p, [])
    | Node (y, q, children) ->
      if p <= q then Node (x, p, queue :: children)
      else Node (y, q, insert' children)
  in
  insert' queue

let remove_min = function
  | Empty -> failwith "Priority queue is empty"
  | Node (x, _, children) ->
    let rec remove_min' = function
      | [] -> failwith "Priority queue is empty"
      | [node] -> x, node
      | node :: nodes ->
        let _, min_node = List.fold_left (fun (p, min_node) node ->
          let p', _ = node in
          if p' < p then (p', node) else (p, min_node)
        ) (fst node, node) nodes in
        x, min_node
    in
    remove_min' children

let main_priority_queue () =
  let queue = Empty in
  let queue = insert 5 1 queue in
  let queue = insert 2 2 queue in
  let queue = insert 8  3 queue in
  let queue = insert 3 4 queue in
  let queue = insert 9 5 queue in
  let x, queue = remove_min queue in
  Printf.printf "Removed: %d\n" x;
  let x, queue = remove_min queue in
  Printf.printf "Removed: %d\n" x;
  let x, queue = remove_min queue in
  Printf.printf "Removed: %d\n" x;
  let x, queue = remove_min queue in
  Printf.printf "Removed: %d\n" x;
  let x, queue = remove_min queue in
  Printf.printf "Removed: %d\n" x

let () =
  main_priority_queue ()