module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer -> Maybe Integer
collatz' steps n
    | n <= 0 = Nothing
    | n == 1 = Just steps
    | even n = collatz' (steps + 1) (div n 2)
    | odd n  = collatz' (steps + 1) (n * 3 + 1)

collatz :: Integer -> Maybe Integer
collatz = collatz' 0
