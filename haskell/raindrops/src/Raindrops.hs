module Raindrops (convert) where

import Data.Maybe (fromMaybe)

values :: [(Int, String)]
values =
    [ (3, "Pling")
    , (5, "Plang")
    , (7, "Plong")
    ]

convert :: Int -> String
convert n = fromMaybe (show n) . mconcat $ fmap f values
    where
        f (i, str)
            | 0 == mod n i = Just str
            | otherwise = Nothing
