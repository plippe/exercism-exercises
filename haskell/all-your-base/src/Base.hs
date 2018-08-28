-- module Base (Error(..), rebase) where
module Base where

import Data.List (find, unfoldr)
import Data.Tuple (swap)

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

fromBase :: Integral a => a -> [a] -> a
fromBase base = sum . map convert . zip [0..] . reverse
    where convert (i, d) =  d * base ^ i

toBase :: Integral a => a -> a -> [a]
toBase base = reverse . unfoldr convert
    where
        convert 0 = Nothing
        convert digit = Just . swap $ quotRem digit base

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase inputBase outputBase inputDigits
    | inputBase  <= 1 = Left InvalidInputBase
    | outputBase <= 1 = Left InvalidOutputBase
    | otherwise = case maybeInvalidDigit of
        Just invalidDigit -> Left . InvalidDigit $ invalidDigit
        Nothing -> Right . toBase outputBase . fromBase inputBase $ inputDigits
        where
            isInvalid d = not . elem d $ [0..inputBase - 1]
            maybeInvalidDigit = find isInvalid inputDigits
