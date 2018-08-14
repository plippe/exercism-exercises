module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

multiples :: [Integer] -> Integer -> [Integer]
multiples factors limit = nub $ concatMap (\f -> [f, f*2 .. limit - 1]) factors

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples = (sum .) . multiples
