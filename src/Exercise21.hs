module Exercise21
    (
      smallestDivisor
    ) where

{- Exercise 1.21.
-- Use the smallest-divisor procedure to find the smallest
-- divisor of each of the following numbers:
-- 199, 1999, 19999.

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
-}

{-
smallest divisors of 199 is 199
1999 -> 1999
19999 -> 7
-}

smallestDivisor :: Integer -> Integer
smallestDivisor n = findDivisor n 2

findDivisor :: Integer -> Integer -> Integer
findDivisor n testDivisor
    | testDivisor^2 > n = n
    | testDivisor `divides` n = testDivisor
    | otherwise = findDivisor n (succ testDivisor)

divides :: Integer -> Integer -> Bool
a `divides` b = b `mod` a == 0
