module Erandom.Core where

import Control.Monad
import System.Random

randomChoice :: [a] -> IO [a]
randomChoice xs = map (xs !!) <$> randomInts (0, length xs - 1)

randomInts :: (Int, Int) -> IO [Int]
randomInts range = liftM (randomRs range) newStdGen
