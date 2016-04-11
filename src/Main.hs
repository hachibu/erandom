module Main where

import BasicPrelude
import Erandom.Core
import Options.Applicative

data Options = Options
  { optionEmojis :: FilePath
  , optionOutput :: FilePath 
  }
  deriving Show

optionsParser :: ParserInfo Options
optionsParser = info (helper <*> options) fullDesc
  where
    options = Options
      <$> argument str (metavar "path/to/emojis.txt")
      <*> strOption ( long "output"
                   <> short 'o'
                   <> value ""
                   <> help "Set output file" )

main :: IO [()]
main = do
  options      <- execParser optionsParser
  randomEmojis <- map lines (readFile $ optionEmojis options) >>= randomChoice

  let output = optionOutput options

  mapM (if null output then putStr
                       else appendFile output) randomEmojis
