module Main where

import           Control.Monad
import qualified Data.IORef as IORef

main :: IO ()
main = do
  ptr <- IORef.newIORef 0
  replicateM_ 100000 $ do
    i <- IORef.readIORef ptr
    IORef.writeIORef ptr (i + 1)
  i <- IORef.readIORef ptr
  print i