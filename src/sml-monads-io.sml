structure SMLMonadsIO :> SML_MONADS_IO = struct

type ('r, 'a) t = ('a -> 'r) -> 'r
fun make f cont = cont(f())
fun unsafePerformIO f = f (fn x => x)

fun lift1 f x1 = make (fn () => f x1)
fun lift2 f (x1, x2) = make (fn () => f (x1, x2))
fun lift3 f (x1, x2, x3) = make (fn () => f (x1, x2, x3))
fun lift4 f (x1, x2, x3, x4) = make (fn () => f (x1, x2, x3, x4))
fun lift5 f (x1, x2, x3, x4, x5) = make (fn () => f (x1, x2, x3, x4, x5))

fun putStr x = lift1 print x
fun putStrLn x = lift1 print (x ^ "\n")

local structure IOMonad = Monad2(struct
                                 type ('r, 'a) t = ('r, 'a) t
                                 fun return x cont = cont x
                                 fun >>=(m, f) cont = m (fn x => f x cont)
                                 end)
in open IOMonad
end

end
