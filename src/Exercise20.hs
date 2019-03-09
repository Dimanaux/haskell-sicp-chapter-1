module Exercise20
    (
      gcd'
    ) where

{- Exercise 1.20.
-- The process that a procedure generates is of course
-- dependent on the rules used by the interpreter. As an
-- example, consider the iterative gcd procedure given
-- above. Suppose we were to interpret this procedure using
-- normal-order evaluation, as discussed in section 1.1.5.
-- (The normal-order-evaluation rule for if is described in
-- exercise 1.5.) Using the substitution method (for normal
-- order), illustrate the process generated in evaluating
-- (gcd 206 40) and indicate the remainder operations that
-- are actually performed. How many remainder operations are
-- actually performed in the normal-order evaluation of
-- (gcd 206 40)? In the applicative-order evaluation?
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
-}

gcd' :: Integer -> Integer -> Integer
gcd' a b = if b == 0 then a else gcd' b (a `mod` b)

{- normal-order
-- gcd 206 40
-- gcd 40 (206 mod 40)
-- if 206 mod 40 == 0 then 40 else gcd (206 mod 40) (40 mod (206 mod 40))
-- if 6 == 0 then 40 else gcd (206 mod 40) (40 mod (206 mod 40) -- + 1
-- gcd (206 mod 40) (40 mod (206 mod 40))
-- if 40 mod (206 mod 40) == 0 -- + 2
--     then (206 mod 40)
--     else gcd (40 mod (206 mod 40)) ((206 mod 40) mod (40 mod (206 mod 40)))
-- gcd (40 mod (206 mod 40)) ((206 mod 40) mod (40 mod (206 mod 40)))
-- if (206 mod 40) mod (40 mod (206 mod 40)) == 0 -- + 4
--     then 40 mod (206 mod 40)
--     else gcd ((206 mod 40) mod (40 mod (206 mod 40))) ((40 mod (206 mod 40)) mod ((206 mod 40) mod (40 mod (206 mod 40))))
-- gcd ((206 mod 40) mod (40 mod (206 mod 40))) ((40 mod (206 mod 40)) mod ((206 mod 40) mod (40 mod (206 mod 40))))
-- if (40 mod (206 mod 40)) mod ((206 mod 40) mod (40 mod (206 mod 40))) == 0 -- + 7
--     then (206 mod 40) mod (40 mod (206 mod 40))
--     else ...
-- (206 mod 40) mod (40 mod (206 mod 40)) -- + 4
-- summary: 18 remainder (mod) calls
-}

{- applicative-order
-- (gcd 206 40)
-- (gcd 40 (206 mod 40))
-- (gcd 40 6)
-- (gcd 6 (40 mod 6))
-- (gcd 6 4)
-- (gcd 4 (6 mod 4))
-- (gcd 4 2)
-- (gcd 2 (4 mod 2))
-- (gcd 2 0)
-- 2
-- summary: 4 remainder (mod) calls
-}

