module DNA (nucleotideCounts) where

import Data.Map (Map, fromList, insert, mapKeys, (!))
import Text.Read (readMaybe)

data Nucleotide = A | C | G | T deriving (Eq, Show, Read, Ord)

toChar :: Nucleotide -> Char
toChar = head . show

toNucleotide :: Char -> Maybe Nucleotide
toNucleotide = readMaybe . pure

toStrand :: String -> Maybe [Nucleotide]
toStrand = traverse toNucleotide

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts xs = maybe (Left xs) (Right . mapKeys toChar . nucleotideCounts') (toStrand xs)

nucleotideCounts' :: [Nucleotide] -> Map Nucleotide Int
nucleotideCounts' ns = foldl f emptyNucleotideCounts ns
    where
        emptyNucleotideCounts = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
        f acc nucleotide = insert nucleotide (acc ! nucleotide + 1) acc
