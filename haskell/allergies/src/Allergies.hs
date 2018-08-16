{-# LANGUAGE ScopedTypeVariables #-}

module Allergies (Allergen(..), allergies, isAllergicTo) where

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Enum, Bounded)

exponent' :: Int -> Maybe Int
exponent' n
    | n < 1 = Nothing
    | otherwise = Just . last $ takeWhile (\v -> n >= 2 ^ v) [0..]

safeToEnum :: forall t . (Enum t, Bounded t) => Int -> Maybe t
safeToEnum i
    | i < fromEnum (minBound :: t) = Nothing
    | i > fromEnum (maxBound :: t) = Nothing
    | otherwise                    = Just . toEnum $ i

allergies :: Int -> [Allergen]
allergies score = case (currentAllergen, nextScore) of
    (Just c, Just s) -> c : allergies s
    (_     , Just s) ->     allergies s
    (_     , _     ) -> []
    where
        currentExp = exponent' score
        currentAllergen = currentExp >>= safeToEnum
        nextScore = fmap (\e -> score - 2 ^ e) currentExp

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen = elem allergen . allergies
