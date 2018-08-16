module SumOfMultiples (sumOfMultiples) where

multiples :: [Integer] -> Integer -> [Integer]
multiples factors limit = filter (\n -> any ((==) 0 . mod n) factors) [1 .. limit - 1]

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples = (sum .) . multiples
