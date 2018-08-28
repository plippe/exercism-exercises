module Acronym (abbreviate) where

import Data.Char (isAlpha, isLower, isUpper, toUpper)
import Data.List (unfoldr)

isNotAlpha :: Char -> Bool
isNotAlpha = not . isAlpha

wordChar :: String -> Maybe (Char, String)
wordChar [] = Nothing
wordChar [x1] = Nothing
wordChar (x1:x2:xs)
    | isLower x1 && isUpper x2 = Nothing
    | isNotAlpha x1 = Nothing
    | isNotAlpha x2 = Just (x1, [])
    | otherwise = Just (x1, x2:xs)

words' :: String -> [String]
words' [] = []
words' xs = word:(words' rest)
    where
        word = unfoldr wordChar xs
        rest = drop (length word + 1) xs

abbreviate :: String -> String
abbreviate =  map (toUpper . head) . filter (not . null) . words'
