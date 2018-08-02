module Raindrops (convert) where

import Data.Bool (bool)

values :: [(Int, String)]
values =
    [ (3, "Pling")
    , (5, "Plang")
    , (7, "Plong")
    ]

modValues :: [(Int, String)] -> Int -> [String]
modValues [] n = []
modValues ((i, str):xs) n = bool [] [str] (mod n i == 0) ++ modValues xs n

convert :: Int -> String
convert n = case modValues values n of
    [] -> show n
    xs -> concat xs
