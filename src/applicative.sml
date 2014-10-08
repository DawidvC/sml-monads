functor Applicative(ApplicativeMin : APPLICATIVE_MIN)
        :> APPLICATIVE where type 'a t = 'a ApplicativeMin.t = struct
  open ApplicativeMin

  infix 4 <$> <*>

  structure FunctorMin = struct
    type 'a t = 'a t
    fun fmap (f, x) = pure f <*> x
  end

  structure Functor = Functor(FunctorMin)

  open Functor

  fun curry f x y = f(x, y)
  fun curry3 f x y z = f(x, y, z)
  fun liftA f x = f <$> x
  fun liftA2 f (x, y) = curry f <$> x <*> y
  fun liftA3 f (x, y, z) = curry3 f <$> x <*> y <*> z
  fun <**> (x, y) = y <*> x
  fun *> (x, y) = curry (fn (x0, y0) => y0) <$> x <*> y
  fun <* (x, y) = curry (fn (x0, y0) => x0) <$> x <*> y
end
