module Diamond (diamond) where

import Data.Char (isAlpha, ord)

format :: Int -> Char -> [Char]
format l c = case c of
    'A' -> padding ++ "A" ++ padding
    c   -> padding ++ [c] ++ margin  ++ [c] ++ padding
    where
        i = ord c - ord 'A'
        padding = replicate (l - i - 1) ' '
        margin = replicate (i * 2 - 1) ' '

diamond :: Char -> Maybe [String]
diamond c
    | not $ isAlpha c = Nothing
    | otherwise = Just $ top ++ bottom
    where letters = ['A'..c]
          limit = length letters
          top = map (format limit) letters
          bottom = tail $ reverse top
