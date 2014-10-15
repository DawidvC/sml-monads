functor Foldable(FoldableMin : FOLDABLE_MIN) : FOLDABLE = struct
  open FoldableMin

  fun foldl f x xs =
      let fun id x = x
          fun f' (x, k) z = k (f(x, z))
      in foldr f' id xs x end

  fun toList t = foldr (op ::) nil t
  fun concat ts = foldr (op @) nil ts
end
