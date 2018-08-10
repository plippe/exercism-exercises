module Anagram (anagramsFor) where

import Data.Char (isUpper, toUpper)
import Data.List (sort)

isAnagram :: String -> String -> Bool
isAnagram a b =
    standardize a == standardize b
    && notAllUpper a
    && notAllUpper b
    where
        standardize = sort . map toUpper
        notAllUpper = not . all isUpper

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)
