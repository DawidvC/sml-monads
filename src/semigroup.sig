signature SEMIGROUP_MIN = sig
  type t
  val <> : t * t -> t
end

signature SEMIGROUP = sig
  type t
  val <> : t * t -> t
end