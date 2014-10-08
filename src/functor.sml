functor Functor3(Functor3Min : FUNCTOR3_MIN)
        :> FUNCTOR3
               where type ('y, 'z, 'a) t = ('y, 'z, 'a) Functor3Min.t =
struct
  open Functor3Min

  val <$> = fmap
  fun <$ (x, y) = fmap(fn _ => x, y)
  fun $> (y, x) = fmap(fn _ => x, y)
  fun void x = fmap(fn _ => (), x)
end

functor Functor2(Functor2Min : FUNCTOR2_MIN)
        :> FUNCTOR2 where type ('y, 'a) t = ('y, 'a) Functor2Min.t = struct
  structure Functor3 = Functor3(struct
                                 type ('y, 'z, 'a) t = ('y, 'a) Functor2Min.t
                                 val fmap = Functor2Min.fmap
                                 end)
  open Functor3
  open Functor2Min
end

functor Functor(FunctorMin : FUNCTOR_MIN)
        :> FUNCTOR where type 'a t = 'a FunctorMin.t = struct
  structure Functor3 = Functor3(struct
                                 type ('y, 'z, 'a) t = 'a FunctorMin.t
                                 val fmap = FunctorMin.fmap
                                 end)
  open Functor3
  open FunctorMin
end
