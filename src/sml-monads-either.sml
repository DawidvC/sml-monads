structure SMLMonadsEither :> SML_MONADS_EITHER = struct
  open Either

  type ('a, 'b) t = ('a, 'b) either

  fun return x = RIGHT x
  fun >>=(RIGHT x, f) = f x
    | >>=(LEFT x, _) = LEFT x

  structure M = Monad2(struct
                        type ('a, 'b) t = ('a, 'b) t
                        val return = return
                        val >>= = >>=
                        end)

  open M
end

functor SMLMonadsEither1(type left_t) :> MONAD where type 'a t = (left_t, 'a) Either.either = struct

  open Either
  open SMLMonadsEither

  type 'a t = (left_t, 'a) either
end
