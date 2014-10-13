functor Monoid(MonoidMin : MONOID_MIN) : MONOID = struct
  open MonoidMin
  val mconcat = foldr mappend mempty
end
