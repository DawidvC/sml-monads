structure SMLMonadsSum : MONOID where type t = int = Monoid(struct
  type t = int
  val mempty = 0
  val mappend = op +
end)
