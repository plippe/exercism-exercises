module TwelveDays (recite) where

import Data.Maybe (fromMaybe)

gift :: Int -> Maybe String
gift 1 = Just "a Partridge in a Pear Tree."
gift 2 = fmap ("two Turtle Doves, and " ++) $ gift 1
gift 3 = fmap ("three French Hens, " ++) $ gift 2
gift 4 = fmap ("four Calling Birds, " ++) $ gift 3
gift 5 = fmap ("five Gold Rings, " ++) $ gift 4
gift 6 = fmap ("six Geese-a-Laying, " ++) $ gift 5
gift 7 = fmap ("seven Swans-a-Swimming, " ++) $ gift 6
gift 8 = fmap ("eight Maids-a-Milking, " ++) $ gift 7
gift 9 = fmap ("nine Ladies Dancing, " ++) $ gift 8
gift 10 = fmap ("ten Lords-a-Leaping, " ++) $ gift 9
gift 11 = fmap ("eleven Pipers Piping, " ++) $ gift 10
gift 12 = fmap ("twelve Drummers Drumming, " ++) $ gift 11
gift _ = Nothing

nth :: Int -> Maybe String
nth 1 = Just "first"
nth 2 = Just "second"
nth 3 = Just "third"
nth 4 = Just "fourth"
nth 5 = Just "fifth"
nth 6 = Just "sixth"
nth 7 = Just "seventh"
nth 8 = Just "eighth"
nth 9 = Just "ninth"
nth 10 = Just "tenth"
nth 11 = Just "eleventh"
nth 12 = Just "twelfth"
nth _ = Nothing

recite' :: Int -> Maybe String
recite' day = do
    nth' <- nth day
    gift' <- gift day
    Just ("On the " ++ nth' ++ " day of Christmas my true love gave to me, " ++ gift')

recite :: Int -> Int -> [String]
recite start stop = fromMaybe [] $ traverse recite' [start..stop]
