functor SMLMonadsStateT(Monad : MONAD) :> SML_MONADS_STATE_T
                                              where type 'a M.t = 'a Monad.t
= struct
  type ('s, 'a) t = 's -> ('a * 's) Monad.t
  structure M = Monad
  fun run m = m
  fun lift m = fn s => M.>>=(m, fn a => M.return (a, s))
  fun eval m s = Monad.>>=(run m s, fn (a, _) => Monad.return a)
  fun exec m s = Monad.>>=(run m s, fn (_, s') => Monad.return s')

  local structure MonadState = MonadState
                                   (struct
                                     type ('s, 'a) t = ('s, 'a) t
                                     fun return x = fn s => Monad.return(x, s)
                                     fun >>=(m, k) =
                                       fn s => Monad.>>=(run m s, fn (a, s') =>
                                       run (k a) s')
                                     val get = fn s => Monad.return(s, s)
                                     fun put s = fn _ => Monad.return((), s)
                                     end)
  in
    open MonadState
  end
end

structure SMLMonadsState :> SML_MONADS_STATE =
let structure T = SMLMonadsStateT(SMLMonadsIdentity)
in struct
  open T
  fun run m s = SMLMonadsIdentity.run (T.run m s)
  fun eval m s = SMLMonadsIdentity.run (T.eval m s)
  fun exec m s = SMLMonadsIdentity.run (T.exec m s)
end end
