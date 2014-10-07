structure SMLMonadsOption =

(*let structure Origin = struct
      type 'a t = 'a option
      structure Applicative = Applicative
                                  (struct
                                    type 'a t = 'a t
                                    fun pure x = SOME x
                                    fun <*>(SOME f, SOME x) = SOME (f x)
                                      | <*> _ = NONE
                                    end)
      val empty = NONE
      fun <|>(NONE, x) = x
        | <|>(x, _) = x
    end

    structure Alt = Alternative(Origin)
in struct
      open Alt
      open Applicative
      open Functor
    end
end*)

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
