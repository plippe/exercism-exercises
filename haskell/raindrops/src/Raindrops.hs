module Raindrops (convert) where

import Data.Bool (bool)

intAndValue :: [(Int, String)]
intAndValue =
    [ (3, "Pling")
    , (5, "Plang")
    , (7, "Plong")
    ]

convert :: Int -> String
convert n
    | null xs    = show n
    | otherwise  = xs
    where
        ifModValue (i, v) = bool "" v (mod n i == 0)
        xs = concatMap ifModValue $ intAndValue
