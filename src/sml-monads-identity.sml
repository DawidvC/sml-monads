structure SMLMonadsIdentity :> SML_MONADS_IDENTITY = struct
  type 'a t = 'a

  fun make x = x
  fun run x = x

  local structure Monad = Monad
                              (struct
                                type 'a t = 'a t
                                fun return x = x
                                fun >>=(m, k) = k m
                                end)
  in
    open Monad
  end
end
