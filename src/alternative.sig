signature ALTERNATIVE_MIN = sig
  type 'a t
  val pure : 'a -> 'a t
  val <*> : ('a -> 'b) t * 'a t -> 'b t
  val empty : 'a t
  val <|> : 'a t * 'a t -> 'a t
end

signature ALTERNATIVE = sig
  type 'a t
  val fmap : ('a -> 'b) * 'a t -> 'b t
  val <$> : ('a -> 'b) * 'a t -> 'b t
  val <$ : 'a * 'b t -> 'a t
  val $> : 'b t * 'a -> 'a t
  val void : 'a t -> unit t
  val pure : 'a -> 'a t
  val <*> : ('a -> 'b) t * 'a t -> 'b t
  val <**> : 'a t * ('a -> 'b) t -> 'b t
  val *> : 'a t * 'b t -> 'b t
  val <* : 'b t * 'a t -> 'b t
  val liftA : ('a -> 'b) -> 'a t -> 'b t
  val liftA2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
  val liftA3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
  val empty : 'a t
  val <|> : 'a t * 'a t -> 'a t
  val some : 'a t -> 'a list t
  val many : 'a t -> 'a list t
  val optional : 'a t -> 'a option t
end
