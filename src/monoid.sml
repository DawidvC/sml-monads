functor Monoid(MonoidMin : MONOID_MIN) : MONOID = struct
  structure S = Semigroup(struct
                  type t = MonoidMin.t
                  val op <> = MonoidMin.mappend
                end)
  open S
  open MonoidMin
  val mconcat = foldr mappend mempty
end
