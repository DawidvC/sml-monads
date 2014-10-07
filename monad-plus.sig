signature MONAD_PLUS_MIN = sig
  type 'a t
  structure Monad : MONAD where type 'a t = 'a t
  val mzero : 'a t
  val mplus : 'a t * 'a t -> 'a t
end

signature MONAD_PLUS = sig
  type 'a t
  structure Functor : FUNCTOR where type 'a t = 'a t
  structure Applicative : APPLICATIVE where type 'a t = 'a t
  structure Alternative : ALTERNATIVE where type 'a t = 'a t
  structure Monad : MONAD where type 'a t = 'a t
  val mzero : 'a t
  val mplus : 'a t * 'a t -> 'a t
  val msum : 'a t list -> 'a t
  val mfilter : ('a -> bool) * 'a t -> 'a t
  val guard : bool -> unit t
end
