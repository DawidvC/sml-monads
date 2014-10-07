signature ALTERNATIVE_MIN = sig
  type 'a t
  structure Applicative : APPLICATIVE where type 'a t = 'a t
  val empty : 'a t
  val <|> : 'a t * 'a t -> 'a t
end

signature ALTERNATIVE = sig
  type 'a t
  structure Applicative : APPLICATIVE where type 'a t = 'a t
  val empty : 'a t
  val <|> : 'a t * 'a t -> 'a t
  val some : 'a t -> 'a list t
  val many : 'a t -> 'a list t
  val optional : 'a t -> 'a option t
end
