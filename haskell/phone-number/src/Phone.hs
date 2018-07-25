module Phone (number) where

import Data.Char (isDigit, intToDigit)

isCode :: String -> Bool
isCode ns = case length ns of
    3 | elem (head ns) ['2'..'9'] -> True
    _ -> False

areaCode :: String -> Maybe String
areaCode ns = case length ns of
    10 -> Just $ take 3 ns
    _ -> Nothing

exchangeCode :: String -> Maybe String
exchangeCode ns = case length ns of
    10 -> Just $ take 3 $ drop 3 ns
    _ -> Nothing

tenDigitNumber :: String -> Maybe String
tenDigitNumber xs = case length ns of
    11 | head ns == '1' -> Just $ tail ns
    10 -> Just ns
    _ -> Nothing
    where ns = filter isDigit xs

number :: String -> Maybe String
number xs = do
    ns <- tenDigitNumber xs
    areaCode' <- areaCode ns
    exchangeCode' <- exchangeCode ns
    if (isCode areaCode') && (isCode exchangeCode') then Just ns
    else Nothing
