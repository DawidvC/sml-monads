signature SML_MONADS_IOREF = sig
  type 'a t
  val make : 'a -> 'a t SMLMonadsIO.IO
  val read : 'a t -> 'a SMLMonadsIO.IO
  val write : 'a t * 'a -> unit SMLMonadsIO.IO
  val modify : 'a t * ('a -> 'a) -> unit SMLMonadsIO.IO
end
