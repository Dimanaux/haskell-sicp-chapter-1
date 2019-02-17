module Exercise15
    (
      sine
    ) where

{- Exercise 1.15.
-- The sine of an angle (specified in radians) can be
-- computed by making use of the approximation sin x ~= x
-- if x is sufficiently small, and the trigonometric
-- identity
-- sin r = 3 sin (r / 3) - 4 (sin (r / 3))^3
-- to reduce the size of the argument of sin. (For purposes
-- of this exercise an angle is considered "sufficiently
-- small" if its magnitude is not greater than 0.1 radians.)
-- These ideas are incorporated in the following procedures:

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

-- a. How many times is the procedure p applied when
-- (sine 12.15) is evaluated?

-- b. What is the order of growth in space and number of
-- steps (as a function of a) used by the process generated
-- by the sine procedure when (sine a) is evaluated?
-}


p :: Float -> Float
p x = 3 * x - 4 * x^3

sine :: Float -> Float
sine x =
    if abs x <= 0.1
        then x
        else p $ sine (x / 3)

{- a. sine 12.15
sine 12.15
p (sine 4.05)
p (p (sine 1.35))
p (p (p (sine 0.45)))
p (p (p (p (sine 0.15))))
p (p (p (p (p (sine 0.05)))))
p (p (p (p (p 0.5))))
-- 5 times
-}

{- b. Order of growth.
-- How many steps does (sine a) takes?
-- Steps = how many times we can devide a before it becomes
-- less than 0.1 * how many steps takes to calculate (p a)
-- = (how many times we can devide a before it becomes less
-- than 1 + 3) * k = k * (log a / log 3 + 3) = Theta(log a)
-- We can find k1 and k2 | k1 * log a < R(a) < k2 * log a
-- k1 = (log 1/3), k2 = k
-- How much space does it takes?
-- (sine a) uses linear-recursive process. There are ~
-- log a / log 3 recursive calls. So space complexity is
-- Theta(log a)
-}
