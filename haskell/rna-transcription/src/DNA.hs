module DNA (toRNA) where

toRNA' :: Char -> Maybe Char
toRNA' 'G' = Just 'C'
toRNA' 'C' = Just 'G'
toRNA' 'T' = Just 'A'
toRNA' 'A' = Just 'U'
toRNA' _ = Nothing

toRNA :: String -> Maybe String
toRNA = traverse toRNA'
