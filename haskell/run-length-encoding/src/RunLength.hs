module RunLength (decode, encode) where

import Data.Char (isDigit)
import Data.List (group)

fromRead :: Read a => a -> String -> a
fromRead a [] = a
fromRead _ xs = read xs

decode :: String -> String
decode [] = ""
decode xs = replicate (fromRead 1 n) y ++ decode ys
    where (n, y:ys) = span isDigit xs

encode :: String -> String
encode = concatMap f . group
    where
        f [x] = [x]
        f xs = (show . length $ xs) ++ [head xs]
