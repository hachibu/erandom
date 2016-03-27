import Erandom.Core
import Options.Applicative

data Options = Options
  { _emojis :: String
  , _output :: String 
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
  randomEmojis <- fmap lines (readFile $ _emojis options) >>= randomChoice

  let output = _output options 

  mapM (if null output then putStr
                       else appendFile output) randomEmojis
