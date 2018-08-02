module Phone (number) where

import Data.Char (isDigit)

isCode :: Char -> Bool
isCode n = elem n ['2'..'9']

number :: String -> Maybe String
number xs = case filter isDigit xs of
    ns@['1',n,_,_,n',_,_,_,_,_,_] | isCode n && isCode n' -> Just $ tail ns
    ns@[    n,_,_,n',_,_,_,_,_,_] | isCode n && isCode n' -> Just ns
    _ -> Nothing
