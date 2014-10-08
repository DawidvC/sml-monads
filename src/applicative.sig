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

signature APPLICATIVE2_MIN = sig
  type ('z, 'a) t
  val pure : 'a -> ('z, 'a) t
  val <*> : ('z, 'a -> 'b) t * ('z, 'a) t -> ('z, 'b) t
end

signature APPLICATIVE2 = sig
  type ('z, 'a) t
  structure Functor2 : FUNCTOR2 where type ('z, 'a) t = ('z, 'a) t
  val pure : 'a -> ('z, 'a) t
  val <*> : ('z, 'a -> 'b) t * ('z, 'a) t -> ('z, 'b) t
  val <**> : ('z, 'a) t * ('z, 'a -> 'b) t -> ('z, 'b) t
  val *> : ('z, 'a) t * ('z, 'b) t -> ('z, 'b) t
  val <* : ('z, 'b) t * ('z, 'a) t -> ('z, 'b) t
  val liftA : ('a -> 'b) -> ('z, 'a) t -> ('z, 'b) t
  val liftA2 : ('a * 'b -> 'c) -> ('z, 'a) t * ('z, 'b) t -> ('z, 'c) t
  val liftA3 : ('a * 'b * 'c -> 'd)
               -> ('z, 'a) t * ('z, 'b) t * ('z, 'c) t -> ('z, 'd) t
end

signature APPLICATIVE3_MIN = sig
  type ('y, 'z, 'a) t
  val pure : 'a -> ('y, 'z, 'a) t
  val <*> : ('y, 'z, 'a -> 'b) t * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
end

signature APPLICATIVE3 = sig
  type ('y, 'z, 'a) t
  structure Functor3 : FUNCTOR3 where type ('y, 'z, 'a) t = ('y, 'z, 'a) t
  val pure : 'a -> ('y, 'z, 'a) t
  val <*> : ('y, 'z, 'a -> 'b) t * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val <**> : ('y, 'z, 'a) t * ('y, 'z, 'a -> 'b) t -> ('y, 'z, 'b) t
  val *> : ('y, 'z, 'a) t * ('y, 'z, 'b) t -> ('y, 'z, 'b) t
  val <* : ('y, 'z, 'b) t * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val liftA : ('a -> 'b) -> ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val liftA2 : ('a * 'b -> 'c)
               -> ('y, 'z, 'a) t * ('y, 'z, 'b) t -> ('y, 'z, 'c) t
  val liftA3 : ('a * 'b * 'c -> 'd)
               -> ('y, 'z, 'a) t * ('y, 'z, 'b) t * ('y, 'z, 'c) t
               -> ('y, 'z, 'd) t
end
