module IsbnVerifier (isbn) where

import Data.Char (digitToInt, isDigit)
import Data.Maybe (fromMaybe)

checksum :: [Int] -> Int
checksum ns = (\n -> mod n 11) . sum . zipWith (*) ns $ [10,9..1]

isValidChecksum :: [Int] -> Bool
isValidChecksum = (== 0) . checksum

isValidLength :: [Int] -> Bool
isValidLength = (== 10) . length

isValidContent :: [Int] -> Bool
isValidContent = all (< 10) . init

isbn :: String -> Bool
isbn xs = all ($ ns) [isValidLength, isValidContent, isValidChecksum]
    where
        ns = concatMap cast xs
        cast x
            | isDigit x = [digitToInt x]
            | x == 'X' = [10]
            | otherwise = []
