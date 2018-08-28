module Acronym where

import Data.Char (isAlpha, isLower, isUpper, toUpper)

letter :: (Char, Char) -> String -> String
letter (x1, x2) xs
    | (not . isAlpha) x1 && isAlpha x2 = x2:xs
    | isLower x1 && isUpper x2         = x2:xs
    | otherwise                        = xs

abbreviate :: String -> String
abbreviate xs = map toUpper . foldr letter [] $ zip (' ':xs) xs
