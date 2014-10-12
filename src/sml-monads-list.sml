structure SMLMonadsList :> SML_MONADS_LIST = struct

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
