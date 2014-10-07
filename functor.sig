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
