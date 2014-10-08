structure Bottom :> sig type t end = struct
  datatype t = Bottom
end

functor Lens2(Functor2 : FUNCTOR2) = struct
type ('z, 'a, 'b, 'c, 'd) t = ('c -> ('z, 'd) Functor2.t)
                              -> 'a -> ('z, 'b) Functor2.t

fun lens ac adb cfd a = Functor2.fmap(adb a, cfd (ac a))
fun at1 f (a,c) = Functor2.fmap(fn b => (b,c), f a)

end

functor Lens(Functor : FUNCTOR) = struct

structure Lens2 = Lens2(struct
                         open Functor
                         type ('z, 'a) t = 'a t
                         end)

open Lens2

type ('a, 'b, 'c, 'd) t = (Bottom.t, 'a, 'b, 'c, 'd) t

end

structure Getting :> GETTING =
let structure L = Lens2(SMLMonadsConst) in
struct
open L
fun view l = let open SMLMonadsConst in run o l make end
end end

structure Setting :> SETTING =
let structure L = Lens(SMLMonadsIdentity) in
struct
open L
fun set l d = let open SMLMonadsIdentity in run (l (fn _ => make d)) end
end end
