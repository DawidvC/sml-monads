signature FUNCTOR_MIN = sig
  type 'a t
  val fmap : ('a -> 'b) * 'a t -> 'b t
end

signature FUNCTOR = sig
  type 'a t
  val fmap : ('a -> 'b) * 'a t -> 'b t
  val <$> : ('a -> 'b) * 'a t -> 'b t
  val <$ : 'a * 'b t -> 'a t
  val $> : 'b t * 'a -> 'a t
  val void : 'a t -> unit t
end

signature FUNCTOR2_MIN = sig
  type ('z, 'a) t
  val fmap : ('a -> 'b) * ('z, 'a) t -> ('z, 'b) t
end

signature FUNCTOR2 = sig
  type ('z, 'a) t
  val fmap : ('a -> 'b) * ('z, 'a) t -> ('z, 'b) t
  val <$> : ('a -> 'b) * ('z, 'a) t -> ('z, 'b) t
  val <$ : 'a * ('z, 'b) t -> ('z, 'a) t
  val $> : ('z, 'b) t * 'a -> ('z, 'a) t
  val void : ('z, 'a) t -> ('z, unit) t
end
