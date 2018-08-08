module SecretHandshake (handshake) where

import Data.Bool (bool)

operations :: [(Int, [String] -> [String])]
operations =
    [ (16, reverse)
    , ( 8, ("jump" :))
    , ( 4, ("close your eyes" :))
    , ( 2, ("double blink" :))
    , ( 1, ("wink" :))
    ]

merge :: (Int, [String]) -> (Int, [String] -> [String]) ->  (Int, [String])
merge (n, ops) (i, f) = bool (n, ops) (r, f ops) (q >= 1)
    where (q, r) = quotRem n i

handshake :: Int -> [String]
handshake n = snd $ foldl merge (n, []) operations
