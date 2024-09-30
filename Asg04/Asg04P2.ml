(* William Romine *)
(* 00103649 *)
(* Dr. Lewis CS414 *)
(* https://courses.cs.cornell.edu/cs3110/2021sp/textbook/modules/ex_stacks.html *)

type 'a stack =
  | Empty
  | Node of 'a * 'a stack

let push x s = Node (x, s)

let pop = function
  | Empty -> failwith "Stack is empty"
  | Node (x, s) -> x, s

let is_empty = function
  | Empty -> true
  | Node _ -> false

let main_stack () =
  let stack = Empty in
  let stack = push 1 stack in
  let stack = push 2 stack in
  let stack = push 3 stack in
  Printf.printf "Is empty: %b\n" (is_empty stack);
  let x, stack = pop stack in
  Printf.printf "Popped: %d\n" x;
  let x, stack = pop stack in
  Printf.printf "Popped: %d\n" x;
  let x, stack = pop stack in
  Printf.printf "Popped: %d\n" x;
  Printf.printf "Is empty: %b\n" (is_empty stack)

let () =
  main_stack ()