module ProteinTranslation(proteins) where

window :: Int -> [a] -> [[a]]
window _ [] = []
window n xs = h : window n t
    where (h, t) = splitAt n xs

proteins' :: String -> Maybe String
proteins' "AUG" = Just "Methionine"
proteins' "UUU" = Just "Phenylalanine"
proteins' "UUC" = Just "Phenylalanine"
proteins' "UUA" = Just "Leucine"
proteins' "UUG" = Just "Leucine"
proteins' "UCU" = Just "Serine"
proteins' "UCC" = Just "Serine"
proteins' "UCA" = Just "Serine"
proteins' "UCG" = Just "Serine"
proteins' "UAU" = Just "Tyrosine"
proteins' "UAC" = Just "Tyrosine"
proteins' "UGU" = Just "Cysteine"
proteins' "UGC" = Just "Cysteine"
proteins' "UGG" = Just "Tryptophan"
proteins' _ = Nothing

proteins :: String -> Maybe [String]
proteins = sequence . takeWhile (not . null) . map proteins' . window 3
