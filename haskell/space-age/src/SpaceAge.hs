module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

earthSecondsPerYear :: Float
earthSecondsPerYear = 31557600

orbitalPeriodRatioToEarthOn :: Planet -> Float
orbitalPeriodRatioToEarthOn Mercury = 0.2408467
orbitalPeriodRatioToEarthOn Venus = 0.61519726
orbitalPeriodRatioToEarthOn Earth = 1
orbitalPeriodRatioToEarthOn Mars = 1.8808158
orbitalPeriodRatioToEarthOn Jupiter = 11.862615
orbitalPeriodRatioToEarthOn Saturn = 29.447498
orbitalPeriodRatioToEarthOn Uranus = 84.016846
orbitalPeriodRatioToEarthOn Neptune = 164.79132

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / secondsPerYear
    where secondsPerYear = earthSecondsPerYear * orbitalPeriodRatioToEarthOn planet
