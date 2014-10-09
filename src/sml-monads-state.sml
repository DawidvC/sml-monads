functor SMLMonadsStateT(Monad : MONAD) = struct
  type ('r, 's, 'a) t
       = 's * ('a * 's -> 'r Monad.t) -> 'r Monad.t
  fun run m = m
  fun eval m s = run m(s, fn (a, _) => Monad.return a)
  fun exec m s = run m(s, fn (_, s') => Monad.return s')
  fun get (s, cont) = cont(s, s)
  fun put s (_, cont) = cont((), s)

  local structure Monad3 = Monad3
                              (struct
                                type ('r, 's, 'a) t = ('r, 's, 'a) t
                                fun return x (s, cont) = cont(x, s)
                                fun >>=(m, k) (s, cont) =
                                    m(s, fn (a, s') => (k a) (s', cont))
                                end)
 (*       structure MonadState = MonadState
                                   (struct
                                     type ('s, 'a) t = ('s, 'a) t
                                     structure Monad2 = Monad2  
                                     fun get (s, cont) = cont(s, s)
                                     fun put s (_, cont) = cont((), s)
                                     end)*)
  in
  (*  open MonadState*)
    open Monad3
    open Applicative3
    open Functor3
  end
end

structure SMLMonadsState = SMLMonadsStateT(SMLMonadsIdentity)
