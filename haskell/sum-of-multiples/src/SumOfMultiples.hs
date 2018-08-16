module SumOfMultiples (sumOfMultiples) where

import Data.List (nub, group, sort, union)

concatDistinct :: Ord a => [[a]] -> [a]
-- concatDistinct = foldl union [] -- doesn't finish
-- concatDistinct = nub . concat -- ~ 11 seconds
concatDistinct = map head . group . sort . concat -- ~ 0.01 seconds


multiples :: [Integer] -> Integer -> [Integer]
multiples factors limit = concatDistinct $ map (\f -> [f, f*2 .. limit - 1]) factors

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples = (sum .) . multiples
