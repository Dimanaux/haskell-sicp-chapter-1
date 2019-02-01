module Exercise03
    ( sumOfSquaresOfTwoMax
    ) where

{- Exercise 1.3
-- Define a procedure that takes three numbers as arguments
-- and returns the sum of the squares
-- of the two larger numbers.
-}

sumOfSquaresOfTwoMax :: (Ord a, Num a) => a -> a -> a -> a
sumOfSquaresOfTwoMax x y z
    | x > y = x^2 + (max y z)^2
    | otherwise = x^2 + (max x z)^2

{-
-- max - embedded function (function in Prelude)
-- we can easily define it ourselves
max :: (Ord a) => a -> a -> a
max x y = if x < y then y else x
-}

