structure SMLMonadsPrimIO :> sig
                               type 'a IO
                               val make : (unit -> 'a) -> 'a IO
                               val unsafePerformIO : 'a IO -> 'a
                             end = struct
                               type 'a IO = unit -> 'a
                               fun make f = f
                               fun unsafePerformIO f = f ()
                             end

structure SMLMonadsIO = struct

open SMLMonadsPrimIO

fun lift1 f x1 = make (fn () => f x1)
fun lift2 f (x1, x2) = make (fn () => f (x1, x2))
fun lift3 f (x1, x2, x3) = make (fn () => f (x1, x2, x3))
fun lift4 f (x1, x2, x3, x4) = make (fn () => f (x1, x2, x3, x4))
fun lift5 f (x1, x2, x3, x4, x5) = make (fn () => f (x1, x2, x3, x4, x5))

fun putStr x = lift1 print x
fun putStrLn x = lift1 print (x ^ "\n")

local structure IOMonad = Monad(struct
                                 type 'a t = 'a IO
                                 fun return x = make (fn () => x)
                                 fun >>=(m, f) = make (fn () =>
                                     let val x = unsafePerformIO m
                                     in unsafePerformIO (f x)
                                     end)
                                 end)
in open IOMonad
   open Applicative
   open Functor
end

end
