signature MONOID_MIN = sig
  type t
  val mempty : t
  val mappend : t * t -> t
end

signature MONOID = sig
  type t
  val mempty : t
  val mappend : t * t -> t
  val mconcat : t list -> t
end
