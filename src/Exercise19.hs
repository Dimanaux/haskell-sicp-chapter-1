module Exercise19
    (
      fib
    ) where

{- Exercise 1.19.
-- There is a clever algorithm for computing the Fibonacci
-- numbers in a logarithmic number of steps. Recall the
-- transformation of the state variables a and b in the
-- fib-iter process of section 1.2.2: a <- a + b and b <- a.
-- Call this transformation T, and observe that applying T
-- over and over again n times, starting with 1 and 0,
-- produces the pair Fib(n + 1) and Fib(n). In other words,
-- the Fibonacci numbers are produced by applying T^n, the
-- nth power of the transformation T, starting with the pair
-- (1,0). Now consider T to be the special case of p = 0 and
-- q = 1 in a family of transformations Tpq, where Tpq
-- transforms the pair (a,b) according to a <- bq + aq + ap
-- and b <- bp + aq. Show that if we apply such a
-- transformation Tpq twice, the effect is the same as using
-- a single transformation Tp'q' of the same form, and
-- compute p' and q' in terms of p and q. This gives us an
-- explicit way to square these transformations, and thus we
-- can compute T^n using successive squaring, as in the
-- fast-expt procedure. Put this all together to complete
-- the following procedure, which runs in a logarithmic
-- number of steps:
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   <??>      ; compute p'
                   <??>      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
-}


{- solution
a <- bq + aq + ap
b <- bp + aq

Tpq(Tpq(a, b)) = Tp'q'(a, b)
Tpq(bq + aq + ap, bp + aq) = Tp'q'(a, b)
(2bpq + 2aqq + bqq + 2apq + app, bpp + 2apq + bqq + aqq)
    = Tp'q'(a, b)
Tp'q'(a, b) = (2bpq + 2aqq + bqq + 2apq + app,
               bpp + 2apq + bqq + aqq)
Tp'q' = (b (2pq + qq) + a(qq + pp) + a(2pq + qq),
         b (pp + qq) + a(2pq + qq))
p' = pp + qq = p^2 + q^2
q' = 2pq + qq = 2pq + q^2
-}

-- in Haskell:
fib :: Integer -> Integer
fib = fibIter 1 0 0 1

-- takes 5 integers
fibIter :: Integral t => t -> t -> t -> t -> t -> t
fibIter a b p q 0 = b
fibIter a b p q count
    | even count = fibIter a b p' q' (count `div` 2)
    | otherwise = fibIter a' b' p q (count - 1)
  where
    a' = b * q + a * q + a * p
    b' = b * p + a * q
    -- the task is to find p' and q'
    p' = p^2 + q^2
    q' = 2 * p * q + q^2
