module Diamond (diamond) where

import Data.Char (isUpper, ord)

row :: Int -> Char -> [Char]
row width char = case char of
    'A' -> padding ++ "A" ++ padding
    char -> padding ++ [char] ++ margin  ++ [char] ++ padding
    where
        index = ord char - ord 'A'
        padding = replicate (width - index - 1) ' '
        margin = replicate (index * 2 - 1) ' '

diamond :: Char -> Maybe [String]
diamond c
    | isUpper c = Just $ top ++ bottom
    | otherwise = Nothing
    where letters = ['A'..c]
          rowWidth = length letters
          top = map (row rowWidth) letters
          bottom = tail $ reverse top
