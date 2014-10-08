functor Monad3(Monad3Min : MONAD3_MIN)
        :> MONAD3 where type ('y, 'z, 'a) t = ('y, 'z, 'a) Monad3Min.t = struct
  open Monad3Min

  infix 1 >>= >>

  fun op >> (m, k) = m >>= (fn _ => k)

  fun =<< (f, m) = m >>= f
  fun >=> (f, g) x = f x >>= g
  fun <=< (g, f) x = f x >>= g

  fun sequence ms =
      let fun k (m, m') = m >>= (fn x =>
                   m' >>= (fn xs =>
                   return (x::xs)))
      in foldr k (return nil) ms
      end

  fun sequence_ ms = foldr (op >>) (return ()) ms

  fun mapM (f, xs) = sequence (map f xs)
  fun mapM_ (f, xs) = sequence_ (map f xs)

  fun filterM (p, []) = return nil
    | filterM (p, (x::xs)) = p x >>= (fn cond =>
                             filterM(p, xs) >>= (fn ys =>
                             return (if cond then x :: ys else ys)))

  fun forM (xs, f) = sequence (map f xs)
  fun forM_ (xs, f) = sequence_ (map f xs)

  fun join m = m >>= (fn x => x)

  fun mapAndUnzipM (f, xs) = sequence (List.map f xs) >>= (return o ListPair.unzip)

  fun zipWithM (f, xs, ys) = sequence (ListPair.map f (xs, ys))

  fun zipWithM_ (f, xs, ys) = sequence_ (ListPair.map f (xs, ys))

  fun foldM (f, x, []) = return x
    | foldM (f, x, (y::ys)) = f(x,y) >>= (fn x => foldM(f, x, ys))

  fun foldM_ (f, x, ys) = foldM(f, x, ys) >> return ()

  fun replicateM (n, m) = sequence (List.tabulate (n, fn _ => m))
  fun replicateM_ (n, m) = sequence_ (List.tabulate (n, fn _ => m))

  fun when (p, m) = if p then m else return ()
  fun unless (p, m) = if p then return () else m

  fun liftM f m1 = m1 >>= (fn x1 => return (f x1))
  fun liftM2 f (m1, m2) = m1 >>= (fn x1 =>
                          m2 >>= (fn x2 =>
                          return (f(x1, x2))))
  fun liftM3 f (m1, m2, m3) = m1 >>= (fn x1 =>
                              m2 >>= (fn x2 =>
                              m3 >>= (fn x3 =>
                              return (f(x1, x2, x3)))))
  fun liftM4 f (m1, m2, m3, m4) = m1 >>= (fn x1 =>
                                  m2 >>= (fn x2 =>
                                  m3 >>= (fn x3 =>
                                  m4 >>= (fn x4 =>
                                  return (f(x1, x2, x3, x4))))))
  fun liftM5 f (m1, m2, m3, m4, m5) = m1 >>= (fn x1 =>
                                      m2 >>= (fn x2 =>
                                      m3 >>= (fn x3 =>
                                      m4 >>= (fn x4 =>
                                      m5 >>= (fn x5 =>
                                      return (f(x1, x2, x3, x4, x5)))))))
  fun ap x = liftM2 (fn (f, x) => f x) x

  structure Applicative3 = Applicative3(struct
                                       type ('y, 'z, 'a) t = ('y, 'z, 'a) t
                                       val pure = return
                                       val <*> = ap
                                       end)
  structure Functor3 = Applicative3.Functor3
end

functor Monad2(Monad2Min : MONAD2_MIN)
        :> MONAD2 where type ('z, 'a) t = ('z, 'a) Monad2Min.t = struct
  structure Monad3 = Monad3(struct
                             type ('y, 'z, 'a) t
                                  = ('z, 'a) Monad2Min.t
                             val return = Monad2Min.return
                             val >>= = Monad2Min.>>=
                             end)

  open Monad3
  open Monad2Min
  structure Applicative2 = Applicative3ToApplicative2(Applicative3)
  structure Functor2 = Functor3ToFunctor2(Functor3)
end

functor Monad(MonadMin : MONAD_MIN)
        :> MONAD where type 'a t = 'a MonadMin.t = struct
  structure Monad3 = Monad3(struct
                             type ('y, 'z, 'a) t
                                  = 'a MonadMin.t
                             val return = MonadMin.return
                             val >>= = MonadMin.>>=
                             end)

  open Monad3
  open MonadMin
  structure Applicative = Applicative3ToApplicative(Applicative3)
  structure Functor = Functor3ToFunctor(Functor3)
end
