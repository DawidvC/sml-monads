structure SMLMonadsProduct : MONOID where type t = int = Monoid(struct
  type t = int
  val mempty = 1
  val mappend = op *
end)
