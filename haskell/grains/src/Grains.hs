module Grains (square, total) where

chessboardSquares = 64

square :: Integer -> Maybe Integer
square n
    | n > chessboardSquares = Nothing
    | n < 1                 = Nothing
    | otherwise             = Just . (^) 2 $ n - 1

total :: Integer
total = case traverse square $ [1..chessboardSquares] of
    Just grains -> sum grains
    Nothing -> error "Invalid state"
