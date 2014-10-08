functor Alternative(AlternativeMin : ALTERNATIVE_MIN)
        :> ALTERNATIVE where type 'a t = 'a AlternativeMin.t = struct
  open AlternativeMin
  open Applicative
  open Functor

  infix 4 <$> <*>
  infix 3 <|>

  fun fmap (f, x) = pure f <*> x
  val op <$> = fmap
  fun curry f x y = f(x, y)
  fun many_v v = some_v v <|> pure nil
  and some_v v = curry (op ::) <$> v <*> many_v v
  val many = many_v
  val some = some_v
  fun optional v = SOME <$> v <|> pure NONE
end
