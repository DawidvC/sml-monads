functor MonadState(MonadStateMin : MONAD_STATE_MIN) : MONAD_STATE = struct
  open MonadStateMin
  open Monad2
  fun modify f = >>=(get, fn s => put(f s))
  fun gets f = >>=(get, fn s => return(f s))
end

functor MonadState3(MonadState3Min : MONAD_STATE3_MIN) : MONAD_STATE3 = struct
  open MonadState3Min
  open Monad3
  fun modify f = >>=(get, fn s => put(f s))
  fun gets f = >>=(get, fn s => return(f s))
end
