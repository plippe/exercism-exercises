module Hamming (distance) where

import Data.List (head, null, tail)

distance :: String -> String -> Maybe Int
distance = distance' 0

distance' :: Int -> String -> String -> Maybe Int
distance' d [] [] = Just d
distance' _ [] _ = Nothing
distance' _ _ [] = Nothing
distance' d (x:xs) (y:ys) = distance' (d + d') xs ys
    where d' = if x == y then 0
              else 1
