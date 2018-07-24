module Isogram (isIsogram) where

import Data.Char (isLetter, toLower)
import Data.List (nub)

isIsogram :: String -> Bool
isIsogram = (\x -> nub x == x) . map toLower . filter isLetter
