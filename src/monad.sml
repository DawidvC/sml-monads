functor Monad(MonadMin : MONAD_MIN) : MONAD = struct
  open MonadMin

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

  structure Applicative = Applicative(struct
                                       type 'a t = 'a t
                                       val pure = return
                                       val <*> = ap
                                       end)
  structure Functor = Applicative.Functor
end
