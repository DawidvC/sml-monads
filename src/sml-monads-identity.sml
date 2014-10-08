structure SMLMonadsIdentity = struct
  type 'a t = 'a

  local structure Monad = Monad
                              (struct
                                type 'a t = 'a t
                                fun return x = x
                                fun >>=(m, k) = k m
                                end)
  in
    open Monad
    open Applicative
    open Functor
  end
end
