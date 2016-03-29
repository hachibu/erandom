{-# LANGUAGE NoImplicitPrelude #-}

module Erandom.Core where

import BasicPrelude
import System.Random

randomChoice :: [a] -> IO [a]
randomChoice xs = map (xs !!) <$> randomInts (0, length xs - 1)

randomInts :: (Int, Int) -> IO [Int]
randomInts (n, m) = liftM (randomRs (n, m)) newStdGen
