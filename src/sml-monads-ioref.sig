signature SML_MONADS_IOREF = sig
  type 'a t
  val make : 'a -> ('z, 'a t) SMLMonadsIO.IO
  val read : 'a t -> ('z, 'a) SMLMonadsIO.IO
  val write : 'a t * 'a -> ('z, unit) SMLMonadsIO.IO
  val modify : 'a t * ('a -> 'a) -> ('z, unit) SMLMonadsIO.IO
end
