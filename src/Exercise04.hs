module Exercise04
    (
      aPlusAbsB
    ) where

{- Exercise 1.4
-- Observe that our model of evaluation allows
-- for combinations whose operators are compound
-- expressions. Use this observation to describe
-- the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
-}

-- if <p> then <a> else <b>
-- if is an expression that returns either <a> or <b>
-- <a>, <b> may be any values (of the same type) even functions
-- if b >  0, aPlusAbsB = a + b
-- if b <= 0, aPlusAbsB = a - b = a + (-b) = a + |b| since b <= 0
-- in general we can say that aPlusAbsB = a + |b|

-- Choose between + and -, then give a and b to it
aPlusAbsB :: (Ord a, Num a) => a -> a -> a
aPlusAbsB a b = (if (b > 0) then (+) else (-)) a b

