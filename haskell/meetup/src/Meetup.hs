module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, addDays, fromGregorian, isLeapYear)
import Data.Time.Calendar.WeekDate (toWeekDate)
import Data.Time.Calendar.MonthDay (monthLength)
import Data.Bool (bool)

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday
             deriving (Enum)

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth
             deriving (Enum)

nextWeekday :: Weekday -> Day -> Day
nextWeekday weekday date = addDays (toInteger daysTo) date
    where
        (_, _, day) = toWeekDate date
        weekday' = fromEnum weekday + 1
        daysTo = (weekday' - day +) $ bool 0 7 (weekday' < day)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = nextWeekday weekday $ fromGregorian year month day
    where
        day = case schedule of
            Teenth -> 13
            Last -> -6 + monthLength (isLeapYear year) month
            schedule -> 1 + 7 * fromEnum schedule
