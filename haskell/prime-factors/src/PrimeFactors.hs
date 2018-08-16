module PrimeFactors (primeFactors) where

primeFactors' :: Integer -> Integer -> [Integer]
primeFactors' n f
    | n <= 1 = []
    | r == 0 = f : primeFactors' q f
    | otherwise = primeFactors' n (f + 1)
        where (q, r) = quotRem n f

primeFactors :: Integer -> [Integer]
primeFactors n = primeFactors' n 2
