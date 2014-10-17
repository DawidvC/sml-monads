structure SMLMonadsListMonad :> SML_MONADS_LIST_MONAD = struct

structure Origin = struct
type 'a t = 'a list
fun return x = [x]
fun >>=(xs, f) = List.concat(List.map f xs)
fun mzero () = nil
fun mplus(xs, ys) = List.concat [xs, ys]
end

structure MonadPlus = MonadPlus(Origin)

open MonadPlus
end

structure SMLMonadsListFoldable :> SML_MONADS_LIST_FOLDABLE = struct

structure F = Foldable(struct
  type 'a t = 'a list
  val foldr = foldr
end)
open F
end

structure SMLMonadsList = struct
  open SMLMonadsListMonad
  open SMLMonadsListFoldable
end