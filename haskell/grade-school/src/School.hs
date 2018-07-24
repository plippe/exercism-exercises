module School (School, add, empty, grade, sorted) where

import Data.List (sort)
import qualified Data.Map.Strict as M
import qualified Data.Set as S

type Student = String
type Grade = Int
type School = M.Map Grade (S.Set Student)

add :: Grade -> Student -> School -> School
add grade student = M.insertWith S.union grade (S.singleton student)

empty :: School
empty = M.empty

grade :: Grade -> School -> [Student]
grade = (S.toAscList .) . M.findWithDefault S.empty

sorted :: School -> [(Grade, [Student])]
sorted = M.toAscList . M.map S.toAscList
