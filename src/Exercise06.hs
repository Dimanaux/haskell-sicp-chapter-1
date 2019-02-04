module Exercise06
    ( newIf
    ) where

import Library (cond)

{- Exercise 1.6
-- Alyssa P. Hacker doesn't see why if needs to be provided
-- as a special form. "Why can't I just define it as an
-- ordinary procedure in terms of cond?" she asks. Alyssa's
-- friend Eva Lu Ator claims this can indeed be done, and
-- she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

-- Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0

-- Delighted, Alyssa uses new-if to rewrite the
-- square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

-- What happens when Alyssa attempts to use this to compute
-- square roots? Explain.
-}

{- This code works in Haskell, since it uses normal-order
-- evaluation.
-- But MIT LISP uses applicative-roder
-- evaluation for functions, so first it calculates
-- arguments. The second new-if's argument is sqrt-iter, so
-- it will first calculate it. And so on... this procedure
-- that uses new-if loops endlessly.
-- So if is a special form to not calculate it's clauses.
-}
newIf :: Bool -> a -> a -> a
newIf predicate thenClause elseClause =
  cond [(predicate, thenClause), (otherwise, elseClause)]

{-
-- OR
newIf :: Bool -> a -> a -> a
newIf predicate thenClause elseClause
  | predicate = thenClause
  | otherwise = elseClause
-}
