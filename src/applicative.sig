signature APPLICATIVE_MIN = sig
  type 'a t
  val pure : 'a -> 'a t
  val <*> : ('a -> 'b) t * 'a t -> 'b t
end

signature APPLICATIVE = sig
  type 'a t
  structure Functor : FUNCTOR where type 'a t = 'a t
  val pure : 'a -> 'a t
  val <*> : ('a -> 'b) t * 'a t -> 'b t
  val <**> : 'a t * ('a -> 'b) t -> 'b t
  val *> : 'a t * 'b t -> 'b t
  val <* : 'b t * 'a t -> 'b t
  val liftA : ('a -> 'b) -> 'a t -> 'b t
  val liftA2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
  val liftA3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
end
