module Exercise07
    (
      sqrt'
    , badSqrt
    , approximately
    ) where


{- Exercise 1.7
-- The good-enough? test used in computing square roots will
-- not be very effective for finding the square roots of
-- very small numbers. Also, in real computers, arithmetic
-- operations are almost always performed with limited
-- precision. This makes our test inadequate for very large
-- numbers. Explain these statements, with examples showing
-- how the test fails for small and large numbers. An
-- alternative strategy for implementing good-enough? is to
-- watch how guess changes from one iteration to the next
-- and to stop when the change is a very small fraction of
-- the guess. Design a square-root procedure that uses this
-- kind of end test. Does this work better for small and
-- large numbers?
-}

{-
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))
-}

badSqrt :: Float -> Float
badSqrt = sqrtIter 1.0

sqrtIter :: Float -> Float -> Float
sqrtIter guess x =
    if isGoodEnough guess x
        then guess
        else sqrtIter (improve guess x) x

isGoodEnough :: Float -> Float -> Bool
isGoodEnough guess x = (guess^2) `approximately` x

-- Both functions use the same epsilon comparison!
-- ! next time use Library.approximately !
approximately :: Float -> Float -> Bool
approximately a b = abs (a - b) < 0.001

improve :: Float -> Float -> Float
improve guess x = average guess (x / guess)

average :: Float -> Float -> Float
average x y = (x + y) / 2


{- Improved functions
sqrt 0.0009 = 0.0403...
sqrt 0.0001 = 0.032308...

sqrt' 0.0009 = 0.030000012...
sqrt' 0.0001 = 0.0010000714...
-}
sqrt' :: Float -> Float
sqrt' = sqrtIter' 1.0

sqrtIter' :: Float -> Float -> Float
sqrtIter' guess x =
    if isGoodEnough' guess nextGuess
        then nextGuess
        else sqrtIter' nextGuess x
  where
    nextGuess = improve guess x

isGoodEnough' :: Float -> Float -> Bool
isGoodEnough' prevGuess guess = guess `approximately` prevGuess
