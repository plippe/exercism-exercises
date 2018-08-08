module Diamond (diamond) where

import Data.Char (isAlpha)

format :: Int -> (Char, Int) -> [Char]
format l (x, i) = case x of
    'A' -> padding ++ "A" ++ padding
    x   -> padding ++ [x] ++ margin  ++ [x] ++ padding
    where
        padding = replicate (l - i) ' '
        margin = replicate (i * 2 - 1) ' '

diamond :: Char -> Maybe [String]
diamond c
    | not $ isAlpha c = Nothing
    | otherwise = Just $ top ++ bottom
    where letterAndIndexes = zip ['A'..c] [0..]
          limit = snd $ last letterAndIndexes
          top = map (format limit) letterAndIndexes
          bottom = tail $ reverse top
