module Pangram (isPangram) where

import Data.Char (isAlpha, toLower)
import Data.List (nub)

alphabetLength :: Int
alphabetLength = 26

isPangram :: String -> Bool
isPangram = (alphabetLength ==) . length . nub . map toLower . filter isAlpha
