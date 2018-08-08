module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Coordinates = Coordinates Integer Integer
data Robot = Robot Bearing Coordinates

bearing :: Robot -> Bearing
bearing (Robot direction _) = direction

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ (Coordinates x y)) = (x, y)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction (x, y) = Robot direction (Coordinates x y)

simulate :: Robot -> String -> Robot
simulate = foldl simulate'

simulate' :: Robot -> Char -> Robot
simulate' (Robot direction coordinates) 'L' = Robot (turnLeft direction) coordinates
simulate' (Robot direction coordinates) 'R' = Robot (turnRight direction) coordinates
simulate' (Robot direction@North (Coordinates x y)) 'A' = Robot direction (Coordinates x (y+1))
simulate' (Robot direction@East (Coordinates x y)) 'A' = Robot direction (Coordinates (x + 1) y)
simulate' (Robot direction@South (Coordinates x y)) 'A' = Robot direction (Coordinates x (y-1))
simulate' (Robot direction@West (Coordinates x y)) 'A' = Robot direction (Coordinates (x - 1) y)
simulate' robot _ = robot

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft West = South
turnLeft South = East
turnLeft East = North

turnRight :: Bearing -> Bearing
turnRight North = East
turnRight East = South
turnRight South = West
turnRight West = North
