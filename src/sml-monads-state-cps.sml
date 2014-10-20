functor SMLMonadsStateCPST(Monad : MONAD) :> SML_MONADS_STATE_CPS_T
                                              where type 'a M.t = 'a Monad.t
= struct
  type ('r, 's, 'a) t
       = 's * ('a * 's -> 'r Monad.t) -> 'r Monad.t
  structure M = Monad
  fun run m s = m(s, fn x => Monad.return x)
  fun lift m (s, cont) = M.>>=(m, fn x => cont(x, s))
  fun eval m s = m(s, fn (a, s') => Monad.return a)
  fun exec m s = m(s, fn (a, s') => Monad.return s')

  local structure MonadState = MonadState3
                                   (struct
                                     type ('r, 's, 'a) t = ('r, 's, 'a) t
                                     fun return x (s, cont) = cont(x, s)
                                     fun >>=(m, k) (s, cont) =
                                         m(s, fn (a, s') => (k a) (s', cont))
                                     fun get (s, cont) = cont(s, s)
                                     fun put s (_, cont) = cont((), s)
                                     end)
  in
    open MonadState
  end
end

structure SMLMonadsStateCPS :> SML_MONADS_STATE_CPS =
let structure T = SMLMonadsStateCPST(SMLMonadsIdentity)
in struct
  open T
  fun run m s = SMLMonadsIdentity.run (T.run m s)
  fun eval m s = SMLMonadsIdentity.run (T.eval m s)
  fun exec m s = SMLMonadsIdentity.run (T.exec m s)
end end
