module ETL (transform) where

import Data.Char (toLower)
import Data.Map (Map, fromList, toList)
import Data.Tuple (swap)

split :: (a, String) -> [(a, Char)]
split (score, string) = map (\char -> (score, char)) string

toLower' :: (a, Char) -> (a, Char)
toLower' (score, char) = (score, toLower char)

transform :: Map a String -> Map Char a
transform = fromList . map swap . map toLower' . concatMap split . toList
