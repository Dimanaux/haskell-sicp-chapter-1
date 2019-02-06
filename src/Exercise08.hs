module Exercise08
    (
      cubeRoot
    ) where

{- Exercise 1.8
-- Newton's method for cube roots is based on the fact that
-- if y is an approximation to the cube root of x, then a
-- better approximation is given by the value
-- (x / y^2 + 2*y) / 3
-}

import Library (approximately)

-- only change this function
improve :: Float -> Float -> Float
improve guess x = (x / guess^2 + 2 * guess) / 3

cubeRoot :: Float -> Float
cubeRoot = cubeRootIter 1.0

-- the same function that sqrtIter' from exercise 1.7
cubeRootIter :: Float -> Float -> Float
cubeRootIter guess x =
    if guess `approximately` nextGuess
        then nextGuess
        else cubeRootIter nextGuess x
  where
    nextGuess = improve guess x
