module Beer (song) where

import Data.Char (toLower, toUpper)

capitalized :: String -> String
capitalized [] = []
capitalized (x:xs) = toUpper x : map toLower xs

song :: String
song = init . concatMap verse $ [99,98..0]

verse :: Int -> String
verse n = (capitalized . bottlesOfBeerOnTheWall) n ++ ", " ++ bottlesOfBeer n ++ ".\n" ++
          takeOneDown n ++ ", " ++ bottlesOfBeerOnTheWall n' ++ ".\n" ++
          "\n"
    where
        n' = case n of
            0 -> 99
            n -> n -1

bottlesOfBeer :: Int -> String
bottlesOfBeer 0 = "no more bottles of beer"
bottlesOfBeer 1 = "1 bottle of beer"
bottlesOfBeer n = show n ++ " bottles of beer"

bottlesOfBeerOnTheWall :: Int -> String
bottlesOfBeerOnTheWall n = bottlesOfBeer n ++ " on the wall"

takeOneDown :: Int -> String
takeOneDown 0 = "Go to the store and buy some more"
takeOneDown 1 = "Take it down and pass it around"
takeOneDown n = "Take one down and pass it around"
