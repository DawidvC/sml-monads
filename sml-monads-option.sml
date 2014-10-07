structure SMLMonadsOption =

let structure Origin = struct
      type 'a t = 'a option
      structure Monad = Monad
                            (struct
                              type 'a t = 'a t
                              fun return x = SOME x
                              fun >>=(SOME x, f) = f x
                                | >>= _ = NONE
                              end)
      val mzero = NONE
      fun mplus(NONE, x) = x
        | mplus(x, _) = x
    end

    structure MonadPlus = MonadPlus(Origin)
in struct
      open MonadPlus
      open Monad
      open Alternative
      open Applicative
      open Functor
    end
end
