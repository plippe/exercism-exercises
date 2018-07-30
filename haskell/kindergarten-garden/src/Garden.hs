module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import Data.Maybe (fromMaybe)
import qualified Data.Map.Strict as M

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

type Garden = M.Map String [Plant]

toPlant :: Char -> Maybe Plant
toPlant 'C' = Just Clover
toPlant 'G' = Just Grass
toPlant 'R' = Just Radishes
toPlant 'V' = Just Violets
toPlant _ = Nothing

splitAtInterval :: Int -> [a] -> [[a]]
splitAtInterval _ [] = []
splitAtInterval step array = (\(h, t) -> [h] ++ splitAtInterval step t) $ splitAt step array

toRow :: String -> String
toRow =
    concatMap (\(r0, r1) -> [r0, r1])
    . uncurry zip
    . (\(a, b) -> (a, tail b))
    . span (/='\n')

garden :: [String] -> String -> Garden
garden students plants =
    foldl (\acc -> \(s, [a, b, c, d]) -> M.insert s [a, c, b, d] acc) M.empty
    . zip students
    . splitAtInterval 4
    . fromMaybe []
    . traverse toPlant
    $ toRow plants

lookupPlants :: String -> Garden -> [Plant]
lookupPlants = (fromMaybe [] .) . M.lookup
