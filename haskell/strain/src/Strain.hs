module Strain (keep, discard) where

import Data.Bool (bool)

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not . p)

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep p (x:xs) = bool [] [x] (p x) ++ keep p xs
