signature SML_MONADS_OPTION_T = sig
  include MONAD_PLUS
  structure M : MONAD
  val run : 'a t -> 'a option M.t
  val lift : 'a M.t -> 'a t
end

signature SML_MONADS_OPTION = MONAD_PLUS where type 'a t = 'a option
