module Library
    (
      cond
    , approximately
    ) where

-- LISP style function cond
cond :: [(Bool, a)] -> a
cond [] = error "Non-exhaustive conditions. At least 1 condition must be true."
cond (x:xs) = if fst x then snd x else cond xs

-- equality epsilon comparison
epsilonComparison :: Float -> Float -> Float -> Bool
epsilonComparison epsilon a b = abs (a - b) < epsilon

-- uses comparison with 0.0001 precision
approximately :: Float -> Float -> Bool
approximately = epsilonComparison 1e-4
