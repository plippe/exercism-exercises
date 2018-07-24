module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

factors :: Int -> [Int]
factors n = filter (\f -> mod n f == 0) [1..n-1]

classify :: Int -> Maybe Classification
classify n
    | n <= 0 = Nothing
    | otherwise = Just classification
    where
        aliquotSum = sum . factors $ n
        classification = case compare n aliquotSum of
            LT -> Abundant
            EQ -> Perfect
            GT -> Deficient
