{-# LANGUAGE TupleSections #-}

module Scrabble (scoreLetter, scoreWord) where

import qualified Data.Map.Strict as M
import Data.Char (toUpper)

scores =
    [ ("AEIOULNRST", 1)
    , ("DG", 2)
    , ("BCMP", 3)
    , ("FHVWY", 4)
    , ("K", 5)
    , ("JX", 8)
    , ("QZ", 10)
    ]

scores' :: M.Map Char Integer
scores' = M.fromList . concatMap toCharScores $ scores
    where toCharScores (xs, s) = map (,s) xs

scoreLetter :: Char -> Integer
scoreLetter x = M.findWithDefault 0 (toUpper x) scores'

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter
