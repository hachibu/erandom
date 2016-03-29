{-# LANGUAGE NoImplicitPrelude #-}

import BasicPrelude
import Erandom.Core
import Options.Applicative

data Options = Options
  { optionEmojis :: FilePath
  , optionOutput :: FilePath 
  }
  deriving Show

optParser :: ParserInfo Options
optParser = info (helper <*> os)
  (fullDesc <> progDesc "erandom -e data/emojis.txt")
  where
    os = Options
      <$> strOption (long "emojis" <> short 'e')
      <*> strOption (long "output" <> short 'o' <> value "")

main :: IO [()]
main = do
  options      <- execParser optParser
  randomEmojis <- fmap lines (readFile $ optionEmojis options) >>= randomChoice

  let output = optionOutput options 

  mapM (if null output then putStr
                       else appendFile output) randomEmojis
