module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isLower, isPunctuation)
import Data.List (isSuffixOf)

isQuestion :: String -> Bool
isQuestion = isSuffixOf "?" . filter (not . isSpace)

isYell :: String -> Bool
isYell xs = any isAlpha xs && all (not . isLower) xs

isQuiet :: String -> Bool
isQuiet = all isSpace

responseFor :: String -> String
responseFor xs = case (isQuestion xs, isYell xs, isQuiet xs) of
    (True, True, _) -> "Calm down, I know what I'm doing!"
    (True, _, _) -> "Sure."
    (_, True, _) -> "Whoa, chill out!"
    (_, _, True) -> "Fine. Be that way!"
    _ -> "Whatever."
