module Exercise18
    (
      fastMul
    ) where

{- Exercise 1.18.
-- Using the results of exercises 1.16 and 1.17, devise a
-- procedure that generates an iterative process for
-- multiplying two integers in terms of adding, doubling,
-- and halving and uses a logarithmic number of steps.
-}

import Library (halve, double)

fastMul :: Int -> Int -> Int
fastMul = fastMulIter 0

fastMulIter :: Int -> Int -> Int -> Int
fastMulIter product 0 _ = product
fastMulIter product x y
    | even y = fastMulIter product (double x) (halve y)
    | otherwise = fastMulIter (product + x) x (y - 1)
