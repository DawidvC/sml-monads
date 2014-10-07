functor Functor(FunctorMin : FUNCTOR_MIN) : FUNCTOR = struct
  open FunctorMin

  val <$> = fmap
  fun <$ (x, y) = fmap(fn _ => x, y)
  fun $> (y, x) = fmap(fn _ => x, y)
  fun void x = fmap(fn _ => (), x)
end
