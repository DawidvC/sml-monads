signature SML_MONADS_IDENTITY = sig
  include MONAD
  val make : 'a -> 'a t
  val run : 'a t -> 'a
end
