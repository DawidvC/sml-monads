functor Functor2(Functor2Min : FUNCTOR2_MIN)
        :> FUNCTOR2 where type ('z, 'a) t = ('z, 'a) Functor2Min.t = struct
  open Functor2Min

  val <$> = fmap
  fun <$ (x, y) = fmap(fn _ => x, y)
  fun $> (y, x) = fmap(fn _ => x, y)
  fun void x = fmap(fn _ => (), x)
end

functor Functor(FunctorMin : FUNCTOR_MIN)
        :> FUNCTOR where type 'a t = 'a FunctorMin.t = struct
  structure Functor2 = Functor2(struct
                                 type ('z, 'a) t = 'a FunctorMin.t
                                 val fmap = FunctorMin.fmap
                                 end)
  open Functor2
  open FunctorMin
end
