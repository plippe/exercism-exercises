module Diamond (diamond) where

import Data.Char (isAlpha)

padding :: Int -> Int -> [Char]
padding l i = take (l - i) $ cycle " "

margin :: Int -> [Char]
margin i = take (i * 2 - 1) $ cycle " "

format :: Int -> (Char, Int) -> [Char]
format l ('A', i) = (padding l i) ++ "A" ++ (padding l i)
format l (x, i) = (padding l i) ++ [x] ++ (margin i) ++ [x] ++ (padding l i)

diamond :: Char -> Maybe [String]
diamond c
    | not $ isAlpha c = Nothing
    | otherwise = Just $ top ++ bottom
    where letterAndIndexes = zip ['A'..c] [0..]
          limit = snd $ last letterAndIndexes
          top = map (format limit) letterAndIndexes
          bottom = tail $ reverse top
