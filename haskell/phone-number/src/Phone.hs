module Phone (number) where

import Data.Char (isDigit)

isCode :: Char -> Bool
isCode n = elem n ['2'..'9']

number' :: String -> Maybe String
number' ns@('1':n:_:_:n':_:_:_:_:_:_:[]) | isCode n && isCode n' = Just $ tail ns
number' ns@(n:_:_:n':_:_:_:_:_:_:[])     | isCode n && isCode n' = Just ns
number' _ = Nothing

number :: String -> Maybe String
number = number' . filter isDigit
