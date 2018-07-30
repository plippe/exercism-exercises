module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

scoreLetter :: Char -> Integer
scoreLetter x
    | elem ux "AEIOULNRST" = 1
    | elem ux "DG" = 2
    | elem ux "BCMP" = 3
    | elem ux "FHVWY" = 4
    | elem ux "K" = 5
    | elem ux "JX" = 8
    | elem ux "QZ" = 10
    | otherwise = 0
    where ux = toUpper x

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter
