#!/usr/bin/env runhaskell

import Control.Monad
import System.Environment
import System.Exit
import System.Random

emojis :: IO [String]
emojis = liftM lines (readFile "emojis.txt")

randomInts :: (Int, Int) -> IO [Int]
randomInts range = liftM (randomRs range) newStdGen

randomEmojis :: IO [String]
randomEmojis = do
  xs <- emojis 
  ys <- randomInts (0, length xs - 1)
  return $ map (xs !!) ys

parseArgs :: IO String
parseArgs = do
  args <- getArgs
  return $ if null args then "erandom" else head args

main :: IO ()
main = do
  path <- parseArgs
  mapM_ (appendFile path) =<< randomEmojis
  exitSuccess
