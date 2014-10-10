signature MONAD_STATE_MIN = sig
  type ('s, 'a) t
  val return : 'a -> ('z, 'a) t
  val >>= : ('z, 'a) t * ('a -> ('z, 'b) t) -> ('z, 'b) t
  val get : ('s, 's) t
  val put : 's -> ('s, unit) t
end

signature MONAD_STATE = sig
  type ('s, 'a) t
  val fmap : ('a -> 'b) * ('z, 'a) t -> ('z, 'b) t
  val <$> : ('a -> 'b) * ('z, 'a) t -> ('z, 'b) t
  val <$ : 'a * ('z, 'b) t -> ('z, 'a) t
  val $> : ('z, 'b) t * 'a -> ('z, 'a) t
  val void : ('z, 'a) t -> ('z, unit) t
  val pure : 'a -> ('z, 'a) t
  val <*> : ('z, 'a -> 'b) t * ('z, 'a) t -> ('z, 'b) t
  val <**> : ('z, 'a) t * ('z, 'a -> 'b) t -> ('z, 'b) t
  val *> : ('z, 'a) t * ('z, 'b) t -> ('z, 'b) t
  val <* : ('z, 'b) t * ('z, 'a) t -> ('z, 'b) t
  val liftA : ('a -> 'b) -> ('z, 'a) t -> ('z, 'b) t
  val liftA2 : ('a * 'b -> 'c) -> ('z, 'a) t * ('z, 'b) t -> ('z, 'c) t
  val liftA3 : ('a * 'b * 'c -> 'd)
               -> ('z, 'a) t * ('z, 'b) t * ('z, 'c) t -> ('z, 'd) t
  val return : 'a -> ('z, 'a) t
  val >>= : ('z, 'a) t * ('a -> ('z, 'b) t) -> ('z, 'b) t
  val >> : ('z, 'a) t * ('z, 'b) t -> ('z, 'b) t
  val mapM : ('a -> ('z, 'b) t) * 'a list -> ('z, 'b list) t
  val mapM_ : ('a -> ('z, 'b) t) * 'a list -> ('z, unit) t
  val forM : 'a list * ('a -> ('z, 'b) t) -> ('z, 'b list) t
  val forM_ : 'a list * ('a -> ('z, 'b) t) -> ('z, unit) t
  val sequence : ('z, 'a) t list -> ('z, 'a list) t
  val sequence_ : ('z, 'a) t list -> ('z, unit) t
  val =<< : ('a -> ('z, 'b) t) * ('z, 'a) t -> ('z, 'b) t
  val >=> : ('a -> ('z, 'b) t) * ('b -> ('z, 'c) t) -> 'a -> ('z, 'c) t
  val <=< : ('b -> ('z, 'c) t) * ('a -> ('z, 'b) t) -> 'a -> ('z, 'c) t
  val join : ('z, ('z, 'a) t) t -> ('z, 'a) t
  val filterM : ('a -> ('z, bool) t) * 'a list -> ('z, 'a list) t
  val mapAndUnzipM : ('a -> ('z, 'b * 'c) t) * 'a list
                     -> ('z, 'b list * 'c list) t
  val zipWithM : ('a * 'b -> ('z, 'c) t) * 'a list * 'b list
                 -> ('z, 'c list) t
  val zipWithM_ : ('a * 'b -> ('z, 'c) t) * 'a list * 'b list -> ('z, unit) t
  val foldM : ('a * 'b -> ('z, 'a) t) * 'a * 'b list -> ('z, 'a) t
  val foldM_ : ('a * 'b -> ('z, 'a) t) * 'a * 'b list -> ('z, unit) t
  val replicateM : int * ('z, 'a) t -> ('z, 'a list) t
  val replicateM_ : int * ('z, 'a) t -> ('z, unit) t
  val when : bool * ('z, unit) t -> ('z, unit) t
  val unless : bool * ('z, unit) t -> ('z, unit) t
  val liftM : ('a -> 'b) -> ('z, 'a) t -> ('z, 'b) t
  val liftM2 : ('a * 'b -> 'c) -> ('z, 'a) t * ('z, 'b) t -> ('z, 'c) t
  val liftM3 : ('a * 'b * 'c -> 'd) -> ('z, 'a) t * ('z, 'b) t * ('z, 'c) t -> ('z, 'd) t
  val liftM4 : ('a * 'b * 'c * 'd -> 'e) -> ('z, 'a) t * ('z, 'b) t * ('z, 'c) t * ('z, 'd) t -> ('z, 'e) t
  val liftM5 : ('a * 'b * 'c * 'd * 'e -> 'f)
               -> ('z, 'a) t * ('z, 'b) t * ('z, 'c) t * ('z, 'd) t * ('z, 'e) t -> ('z, 'f) t
  val ap : ('z, 'a -> 'b) t * ('z, 'a) t -> ('z, 'b) t
  val get : ('s, 's) t
  val put : 's -> ('s, unit) t
  val modify : ('s -> 's) -> ('s, unit) t
  val gets : ('s -> 'a) -> ('s, 'a) t
end

signature MONAD_STATE3_MIN = sig
  type ('z, 's, 'a) t
  val return : 'a -> ('y, 'z, 'a) t
  val >>= : ('y, 'z, 'a) t * ('a -> ('y, 'z, 'b) t) -> ('y, 'z, 'b) t
  val get : ('z, 's, 's) t
  val put : 's -> ('z, 's, unit) t
end

signature MONAD_STATE3 = sig
  type ('z, 's, 'a) t
  val fmap : ('a -> 'b) * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val <$> : ('a -> 'b) * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val <$ : 'a * ('y, 'z, 'b) t -> ('y, 'z, 'a) t
  val $> : ('y, 'z, 'b) t * 'a -> ('y, 'z, 'a) t
  val void : ('y, 'z, 'a) t -> ('y, 'z, unit) t
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
  val return : 'a -> ('y, 'z, 'a) t
  val >>= : ('y, 'z, 'a) t * ('a -> ('y, 'z, 'b) t) -> ('y, 'z, 'b) t
  val >> : ('y, 'z, 'a) t * ('y, 'z, 'b) t -> ('y, 'z, 'b) t
  val mapM : ('a -> ('y, 'z, 'b) t) * 'a list -> ('y, 'z, 'b list) t
  val mapM_ : ('a -> ('y, 'z, 'b) t) * 'a list -> ('y, 'z, unit) t
  val forM : 'a list * ('a -> ('y, 'z, 'b) t) -> ('y, 'z, 'b list) t
  val forM_ : 'a list * ('a -> ('y, 'z, 'b) t) -> ('y, 'z, unit) t
  val sequence : ('y, 'z, 'a) t list -> ('y, 'z, 'a list) t
  val sequence_ : ('y, 'z, 'a) t list -> ('y, 'z, unit) t
  val =<< : ('a -> ('y, 'z, 'b) t) * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val >=> : ('a -> ('y, 'z, 'b) t) * ('b -> ('y, 'z, 'c) t) -> 'a -> ('y, 'z, 'c) t
  val <=< : ('b -> ('y, 'z, 'c) t) * ('a -> ('y, 'z, 'b) t) -> 'a -> ('y, 'z, 'c) t
  val join : ('y, 'z, ('y, 'z, 'a) t) t -> ('y, 'z, 'a) t
  val filterM : ('a -> ('y, 'z, bool) t) * 'a list -> ('y, 'z, 'a list) t
  val mapAndUnzipM : ('a -> ('y, 'z, 'b * 'c) t) * 'a list
                     -> ('y, 'z, 'b list * 'c list) t
  val zipWithM : ('a * 'b -> ('y, 'z, 'c) t) * 'a list * 'b list
                 -> ('y, 'z, 'c list) t
  val zipWithM_ : ('a * 'b -> ('y, 'z, 'c) t) * 'a list * 'b list
                  -> ('y, 'z, unit) t
  val foldM : ('a * 'b -> ('y, 'z, 'a) t) * 'a * 'b list -> ('y, 'z, 'a) t
  val foldM_ : ('a * 'b -> ('y, 'z, 'a) t) * 'a * 'b list
               -> ('y, 'z, unit) t
  val replicateM : int * ('y, 'z, 'a) t -> ('y, 'z, 'a list) t
  val replicateM_ : int * ('y, 'z, 'a) t -> ('y, 'z, unit) t
  val when : bool * ('y, 'z, unit) t -> ('y, 'z, unit) t
  val unless : bool * ('y, 'z, unit) t -> ('y, 'z, unit) t
  val liftM : ('a -> 'b) -> ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val liftM2 : ('a * 'b -> 'c) -> ('y, 'z, 'a) t * ('y, 'z, 'b) t -> ('y, 'z, 'c) t
  val liftM3 : ('a * 'b * 'c -> 'd) -> ('y, 'z, 'a) t * ('y, 'z, 'b) t * ('y, 'z, 'c) t -> ('y, 'z, 'd) t
  val liftM4 : ('a * 'b * 'c * 'd -> 'e) -> ('y, 'z, 'a) t * ('y, 'z, 'b) t * ('y, 'z, 'c) t * ('y, 'z, 'd) t -> ('y, 'z, 'e) t
  val liftM5 : ('a * 'b * 'c * 'd * 'e -> 'f)
               -> ('y, 'z, 'a) t * ('y, 'z, 'b) t * ('y, 'z, 'c) t * ('y, 'z, 'd) t * ('y, 'z, 'e) t -> ('y, 'z, 'f) t
  val ap : ('y, 'z, 'a -> 'b) t * ('y, 'z, 'a) t -> ('y, 'z, 'b) t
  val get : ('z, 's, 's) t
  val put : 's -> ('z, 's, unit) t
  val modify : ('s -> 's) -> ('z, 's, unit) t
  val gets : ('s -> 'a) -> ('z, 's, 'a) t
end
