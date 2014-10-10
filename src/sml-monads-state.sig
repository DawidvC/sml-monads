signature SML_MONADS_STATE_T = sig
  include MONAD_STATE3
  structure M : MONAD
  val run : ('a * 's, 's, 'a) t -> 's -> ('a * 's) M.t
  val eval : ('a, 's, 'a) t -> 's -> 'a M.t
  val exec : ('s, 's, 'a) t -> 's -> 's M.t
end

signature SML_MONADS_STATE = sig
  include MONAD_STATE3
  val run : ('a * 's, 's, 'a) t -> 's -> ('a * 's)
  val eval : ('a, 's, 'a) t -> 's -> 'a
  val exec : ('s, 's, 'a) t -> 's -> 's
end
