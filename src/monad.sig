signature MONAD_MIN = sig
  type 'a t
  val return : 'a -> 'a t
  val >>= : 'a t * ('a -> 'b t) -> 'b t
end

signature MONAD = sig
  type 'a t
  structure Functor : FUNCTOR where type 'a t = 'a t
  structure Applicative : APPLICATIVE where type 'a t = 'a t
  val return : 'a -> 'a t
  val >>= : 'a t * ('a -> 'b t) -> 'b t
  val >> : 'a t * 'b t -> 'b t
  val mapM : ('a -> 'b t) * 'a list -> 'b list t
  val mapM_ : ('a -> 'b t) * 'a list -> unit t
  val forM : 'a list * ('a -> 'b t) -> 'b list t
  val forM_ : 'a list * ('a -> 'b t) -> unit t
  val sequence : 'a t list -> 'a list t
  val sequence_ : 'a t list -> unit t
  val =<< : ('a -> 'b t) * 'a t -> 'b t
  val >=> : ('a -> 'b t) * ('b -> 'c t) -> 'a -> 'c t
  val <=< : ('b -> 'c t) * ('a -> 'b t) -> 'a -> 'c t
  val join : 'a t t -> 'a t
  val filterM : ('a -> bool t) * 'a list -> 'a list t
  (*val mapAndUnzipM : ('a -> ('b * 'c) t) * 'a list -> ('b list * 'c list) t
  val zipWithM : ('a * 'b -> 'c t) * 'a list * 'b list -> 'c list t
  val zipWithM_ : ('a * 'b -> 'c t) * 'a list * 'b list -> unit t
  val foldM : ('a * 'b -> 'a t) * 'a * 'b list -> 'a t
  val foldM_ : ('a * 'b -> 'a t) * 'a * 'b list -> unit t
  val replicateM : int * 'a t -> 'a list t
  val replicateM_ : int * 'a t -> unit t*)
  val when : bool * unit t -> unit t
  val unless : bool * unit t -> unit t
  val liftM : ('a -> 'b) -> 'a t -> 'b t
  val liftM2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
  val liftM3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
  val liftM4 : ('a * 'b * 'c * 'd -> 'e) -> 'a t * 'b t * 'c t * 'd t -> 'e t
  val liftM5 : ('a * 'b * 'c * 'd * 'e -> 'f)
               -> 'a t * 'b t * 'c t * 'd t * 'e t -> 'f t
  val ap : ('a -> 'b) t * 'a t -> 'b t
end
