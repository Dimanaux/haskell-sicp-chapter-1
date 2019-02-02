module Exercise05
    ( test,
      p
    ) where

{- Exercise 1.5
-- Ben Bitdiddle has invented a test to determine whether
-- the interpreter he is faced with is using
-- applicative-order evaluation or normal-order evaluation.
-- He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

-- Then he evaluates the expression

(test 0 (p))

-- What behavior will Ben observe with an interpreter that
-- uses applicative-order evaluation? What behavior will he
-- observe with an interpreter that uses normal-order evaluation?
-- Explain your answer. (Assume that the evaluation rule
-- for the special form if is the same whether the
-- interpreter is using normal or applicative order:
-- The predicate expression is evaluated first, and the
-- result determines whether to evaluate the consequent or
-- the alternative expression.)
-}

p :: t
p = p

-- test 0 p ?
-- if the interpreter uses applicative-order evaluation
-- then we won't see any answer, since it would first
-- evaluate both 0 and p, then it would substitue p with p,
-- then it would evaluate p again and again in infinite loop

-- if the interpreter uses normal-order evaluation
-- then it won't evaluate value of p before we need it
-- so it will just evaluate 0, and 0 == 0 is true, 0 will
-- be returned.
-- Haskell interpreter - GHCi - uses normal-order evaluation
test :: (Eq a, Num a) => a -> a -> a
test x y = if x == 0 then 0 else y

-- to test it yourself run `$ stack ghci src/Exercise05.hs`
-- then `> test 0 p`
-- output should be `0`
