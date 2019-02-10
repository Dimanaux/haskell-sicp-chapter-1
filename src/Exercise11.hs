module Exercise11
    (
      f
    , f'
    ) where

{- Exercise 1.11.
-- A function f is defined by the rule that f(n) = n if n<3
-- and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>=3.
-- Write a procedure that computes f by means of a
-- recursive process.
-- Write a procedure that computes f by means of an
-- iterative process.
-}

{- Samples
f 0 = 0
f 1 = 1
f 2 = 2
f 3 = 4
f 4 = 11
f 5 = 25
f 6 = 59...
-}

-- recursive
f :: Int -> Int
f n
    | n < 3 = n
    | otherwise = f (n - 1) + 2 * f (n - 2) + 3 * f (n - 3)

-- iterative
f' :: Int -> Int
f' n = fIter n 0 1 2

fIter :: Int -> Int -> Int -> Int -> Int
fIter 0 a _ _ = a
fIter i a b c = fIter (i - 1) b c (3 * a + 2 * b + c)
