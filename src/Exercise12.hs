module Exercise12
    (
      pascalsTriangle
    ) where

{- Exercise 1.12.
-- The following pattern of numbers is called Pascal's
-- triangle.
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
   ...
-- The numbers at the edge of the triangle are all 1, and
-- each number inside the triangle is the sum of the two
-- numbers above it. Write a procedure that computes
-- elements of Pascal's triangle by means of a recursive
-- process.
-}


{- recursive function to calculate Pascal's triangle
-- the first parameter is ROW (indexing starts with 1)
-- the second parameter is INDEX (indexing starts with 1
-- from the left)
-- all rows have 1 in index 1
-- pascalsTriangle 4 2 = 4
-- pascalsTriangle 4 3 = 6
-- index must be 0 < index <= row
-- row must be 0 < row
-}
pascalsTriangle :: Int -> Int -> Int
pascalsTriangle _ 1 = 1
pascalsTriangle row ind
    | row == ind = 1
    | otherwise = ((+) (pascalsTriangle (row - 1) ind)
                       (pascalsTriangle (row - 1) (ind - 1)))
