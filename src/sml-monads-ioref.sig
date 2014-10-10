signature SML_MONADS_IOREF = sig
  type 'a t
  val make : 'a -> ('z, 'a t) SMLMonadsIO.t
  val read : 'a t -> ('z, 'a) SMLMonadsIO.t
  val write : 'a t * 'a -> ('z, unit) SMLMonadsIO.t
  val modify : 'a t * ('a -> 'a) -> ('z, unit) SMLMonadsIO.t
end
