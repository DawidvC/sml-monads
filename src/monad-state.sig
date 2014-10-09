signature MONAD_STATE_MIN = sig
  type ('s, 'a) t
  structure Monad2 : MONAD2 where type ('s, 'a) t = ('s, 'a) t
  val get : ('s, 's) t
  val put : 's -> ('s, unit) t
end

signature MONAD_STATE = sig
  type ('s, 'a) t
  structure Monad2 : MONAD2 where type ('s, 'a) t = ('s, 'a) t
  val get : ('s, 's) t
  val put : 's -> ('s, unit) t
  val modify : ('s -> 's) -> ('s, unit) t
  val gets : ('s -> 'a) -> ('s, 'a) t
end
