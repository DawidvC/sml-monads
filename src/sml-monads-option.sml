structure SMLMonadsOption =

let structure Origin = struct
      type 'a t = 'a option
      fun return x = SOME x
      fun >>=(SOME x, f) = f x
        | >>= _ = NONE
      val mzero = NONE
      fun mplus(NONE, x) = x
        | mplus(x, _) = x
    end

    structure MonadPlus = MonadPlus(Origin)
in struct
      open MonadPlus
    end
end
