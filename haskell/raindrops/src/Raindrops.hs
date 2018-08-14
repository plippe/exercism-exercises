module Raindrops (convert) where

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
        xs = concatMap ifModValue intAndValue
        ifModValue (i, v) = if mod n i == 0 then v else ""
