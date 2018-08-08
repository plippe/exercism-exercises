module ETL (transform) where

import Control.Arrow (second)
import Data.Char (toLower)
import Data.Map (Map, fromList, toList)
import Data.Tuple (swap)

split :: (a, String) -> [(a, Char)]
split (score, string) = map (\char -> (score, char)) string

transform :: Map a String -> Map Char a
transform = fromList . map (swap . second toLower) . concatMap split . toList
