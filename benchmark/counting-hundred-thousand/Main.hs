module Main where

import Control.Monad.State.Strict

main :: IO ()
main = print (execState (replicateM_ 100000 (get >>= \i -> put (i+1))) 0)