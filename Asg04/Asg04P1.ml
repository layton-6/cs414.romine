(* William Romine *)
(* 00103649 *)
(* Dr. Lewis CS414 *)
(* https://cs3110.github.io/textbook/chapters/data/trees.html *)

type 'a tree =
  | Empty
  | Node of 'a list * 'a tree list

let rec height = function
  | Empty -> 0
  | Node (_, children) ->
    1 + List.fold_left (fun max h -> max h (height h)) 0 children

let rec inorder f = function
  | Empty -> ()
  | Node (keys, children) ->
    List.iter (fun child -> inorder f child) children;
    List.iter f keys

let rec preorder f = function
  | Empty -> ()
  | Node (keys, children) ->
    List.iter f keys;
    List.iter (fun child -> preorder f child) children

let rec postorder f = function
  | Empty -> ()
  | Node (keys, children) ->
    List.iter (fun child -> postorder f child) children;
    List.iter f keys

let rec insert x = function
  | Empty -> Node ([x], [])
  | Node (keys, children) ->
    let i = List.find_index (fun k -> k >= x) keys in
    if i = -1 then
      Node (keys @ [x], children @ [Empty])
    else
      let left, right = List.split_at i keys in
      Node (left @ [x], children @ [insert x (List.nth children i)])

let main_tree () =
  let tree = Empty in
  let tree = insert 5 tree in
  let tree = insert 2 tree in
  let tree = insert 8 tree in
  let tree = insert 3 tree in
  let tree = insert 9 tree in
  Printf.printf "Height: %d\n" (height tree);
  Printf.printf "Inorder: ";
  inorder (fun x -> Printf.printf "%d " x) tree;
  Printf.printf "\n";
  Printf.printf "Preorder: ";
  preorder (fun x -> Printf.printf "%d " x) tree;
  Printf.printf "\n";
  Printf.printf "Postorder: ";
  postorder (fun x -> Printf.printf "%d " x) tree;
  Printf.printf "\n"

let () =
  main_tree ()