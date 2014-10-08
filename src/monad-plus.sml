functor MonadPlus(MonadPlusMin : MONAD_PLUS_MIN)
        :> MONAD_PLUS where type 'a t = 'a MonadPlusMin.t = struct
  open MonadPlusMin

  structure Functor = Monad.Functor
  structure Applicative = Monad.Applicative
  structure Alternative = Alternative(struct
                                       type 'a t = 'a t
                                       structure Applicative = Applicative
                                       val empty = mzero
                                       val <|> = mplus
                                       end)

  open Monad
  infix 1 >>=

  fun guard true = return ()
    | guard false = mzero

  fun msum xs = foldr mplus mzero xs

  fun mfilter (p, m) = m >>= (fn x => if p x then return x else mzero)
end
