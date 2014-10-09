functor SMLMonadsStateT(Monad : MONAD) = struct
  type ('s, 'a) t = 's -> ('a * 's) Monad.t
  fun run m = m
  fun eval m s = Monad.>>=(run m s, fn (a, _) => Monad.return a)
  fun exec m s = Monad.>>=(run m s, fn (_, s') => Monad.return s')

  local structure Monad2 = Monad2
                              (struct
                                type ('s, 'a) t = ('s, 'a) t
                                fun return x = fn s => Monad.return(x, s)
                                fun >>=(m, k) =
                                    fn s => Monad.>>=(run m s, fn (a, s') =>
                                            run (k a) s')
                                end)
        structure MonadState = MonadState
                                   (struct
                                     type ('s, 'a) t = ('s, 'a) t
                                     structure Monad2 = Monad2
                                     val get = fn s => Monad.return(s, s)
                                     fun put s = fn _ => Monad.return((), s)
                                     end)
  in
    open MonadState
    open Monad2
    open Applicative2
    open Functor2
  end
end

structure SMLMonadsState = SMLMonadsStateT(SMLMonadsIdentity)
