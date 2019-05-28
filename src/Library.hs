module Library
    (
      cond
    , approximately
    , halve
    , double
    , randomList
    ) where

import System.Random (mkStdGen, randoms)

-- LISP style function cond (for 1.1)
cond :: [(Bool, a)] -> a
cond [] = error "Non-exhaustive conditions. At least 1 condition must be true."
cond (x:xs) = if fst x then snd x else cond xs

-- equality epsilon comparison
epsilonComparison :: Float -> Float -> Float -> Bool
epsilonComparison epsilon a b = abs (a - b) < epsilon

-- uses comparison with 0.0001 precision
approximately :: Float -> Float -> Bool
approximately = epsilonComparison 1e-4

double :: Int -> Int
double = (*2)

halve :: Int -> Int
halve = (`div` 2)

randomList :: Integer -> [Integer]
randomList n = map (`mod` n) (randoms (mkStdGen (fromIntegral n)))
