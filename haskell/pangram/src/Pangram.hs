module Pangram (isPangram) where

import Data.Char (isAlpha, toLower)
import Data.Set (fromList, toList)

alphabetLength :: Int
alphabetLength = 26

isPangram :: String -> Bool
isPangram = (alphabetLength ==) . length . toList . fromList . map toLower . filter isAlpha
