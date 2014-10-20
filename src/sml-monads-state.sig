signature SML_MONADS_STATE_T = sig
  include MONAD_STATE
  structure M : MONAD
  val run : ('s, 'a) t -> 's -> ('a * 's) M.t
  val lift : 'a M.t -> ('s, 'a) t
  val eval : ('s, 'a) t -> 's -> 'a M.t
  val exec : ('s, 'a) t -> 's -> 's M.t
end

signature SML_MONADS_STATE = sig
  include MONAD_STATE
  val run : ('s, 'a) t -> 's -> ('a * 's)
  val eval : ('s, 'a) t -> 's -> 'a
  val exec : ('s, 'a) t -> 's -> 's
end
