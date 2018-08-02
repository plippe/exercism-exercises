module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number xs = case filter isDigit xs of
    ns@['1',n,_,_,n',_,_,_,_,_,_] | all (> '1') [n,n'] -> Just $ tail ns
    ns@[    n,_,_,n',_,_,_,_,_,_] | all (> '1') [n,n'] -> Just ns
    _ -> Nothing
