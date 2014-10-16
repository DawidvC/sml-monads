functor Foldable(FoldableMin : FOLDABLE_MIN) : FOLDABLE = struct
  open FoldableMin

  fun foldl f x xs =
      let fun id x = x
          fun f' (x, k) z = k (f(x, z))
      in foldr f' id xs x end
  fun foldr1 f = foldr (fn (x, NONE) => SOME x
                       | (x, SOME y) => SOME(f(x,y))) NONE
  fun foldl1 f = foldl (fn (x, NONE) => SOME x
                       | (x, SOME y) => SOME(f(x,y))) NONE
  fun toList t = foldr (op ::) nil t
  fun concat ts = foldr (op @) nil ts
  fun concatMap f = foldr (fn (a,b) => f a @ b) nil
  fun exists p = foldr (fn (a,b) => if b then b else p a) false
  fun all p = foldr (fn (a,b) => if b then p a else b) true
  fun maximumBy compare = foldr1 (fn (a,b) => case compare(a,b) of
                                                  GREATER => a
                                                | EQUAL => b
                                                | LESS => b)
  fun minimumBy compare = foldr1 (fn (a,b) => case compare(a,b) of
                                                  GREATER => b
                                                | EQUAL => a
                                                | LESS => a)
end
