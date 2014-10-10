functor MonadState(MonadStateMin : MONAD_STATE_MIN)
        :> MONAD_STATE where type ('s, 'a) t = ('s, 'a) MonadStateMin.t =
struct
  open MonadStateMin
  structure Monad2 = Monad2(MonadStateMin)
  open Monad2
  fun modify f = >>=(get, fn s => put(f s))
  fun gets f = >>=(get, fn s => return(f s))
end

functor MonadState3(MonadState3Min : MONAD_STATE3_MIN)
        :> MONAD_STATE3 where type ('r, 's, 'a) t
                                   = ('r, 's, 'a) MonadState3Min.t =
struct
  open MonadState3Min
  structure Monad3 = Monad3(MonadState3Min)
  open Monad3
  fun modify f = >>=(get, fn s => put(f s))
  fun gets f = >>=(get, fn s => return(f s))
end
