let add a b = failwith "TODO add"

let filter p xs = failwith "TODO filter"

let starts_with haystack hay = failwith "TODO starts_with"

type tree = Empty | Node of int * tree * tree;;
                            
type 'a ltree = LNode of 'a * (unit -> 'a ltree) * (unit -> 'a ltree);; 
                                                   
let rec layer_tree number = 
  LNode (number , (fun () -> layer_tree (number + 1)), (fun () -> layer_tree (number + 1)));;

let rec interval_tree l0 h0 = 
  LNode ((l0,h0), (fun () -> interval_tree l0 ((l0 +. h0) /. 2.0)), (fun () -> interval_tree ((l0 +. h0) /. 2.0) h0));;

let rec rational_tree n d =
  LNode ((n, d), (fun () -> rational_tree n (d + 1)), (fun () -> rational_tree (n + 1) d));;

let rec map f t =
  match t with
  |LNode (n,f1,f2) -> LNode(f n,(fun () -> map f (f1())),(fun () -> map f (f2())))
;;


let rec findWithList p lst = 
  match lst with
  |(LNode (n,f1,f2))::xs -> if(p n) then LNode (n,f1,f2) else findWithList p (xs @ [f1();f2()]);;
  

let rec find p t = findWithList p [t];; 

let rec top n t = 
  match t with
  |LNode (n1,f1,f2) -> 
      if (n = 1) then Node (n1, Empty, Empty)
      else Node(n1, top (n - 1) (f1()), top (n - 1) (f2()));;













  
    



  




