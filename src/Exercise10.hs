module Exercise10 where

{- Exercise 1.10.
-- The following procedure computes a mathematical function
-- called Ackermann's function.
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

-- What are the values of the following expressions?
(A 1 10)

(A 2 4)

(A 3 3)

-- Consider the following procedures, where A
-- is the procedure defined above:
(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

-- Give concise mathematical definitions for the functions
-- computed by the procedures f, g, and h for positive
-- integer values of n. For example, (k n) computes 5n^2.
-}

-- in Haskell:
-- Ackermann's function
a :: Int -> Int -> Int
a _ 0 = 0
a 0 y = 2 * y
a _ 1 = 2
a x y = a (x - 1) (a x (y - 1))


{- IMPORTANT NOTE
-- The processes below may not relate to Haskell 
-}

{- (A 1 10)
a 1 10
a 0 (a 1 9)
a 0 (a 0 (a 1 8))
a 0 (a 0 (a 0 (a 1 7)))
a 0 (a 0 (a 0 (a 0 (a 1 6))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 1 5)))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 1 4))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 1 3)))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 1 2))))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 1 1)))))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 2))))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 4)))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 0 8))))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 16)))))
a 0 (a 0 (a 0 (a 0 (a 0 32))))
a 0 (a 0 (a 0 (a 0 64)))
a 0 (a 0 (a 0 128))
a 0 (a 0 256)
a 0 512
1024
-}

{- (A 2 4)
a 2 4
a 1 (a 2 3)
a 1 (a 1 (a 2 2))
a 1 (a 1 (a 1 (a 2 1)))
a 1 (a 1 (a 1 2))
a 1 (a 1 (a 0 (a 1 1)))
a 1 (a 1 (a 0 2))
a 1 (a 1 4)
a 1 (a 0 (a 1 3))
a 1 (a 0 (a 0 (a 1 2)))
a 1 (a 0 (a 0 (a 0 (a 1 1))))
a 1 (a 0 (a 0 (a 0 2)))
a 1 (a 0 (a 0 4))
a 1 (a 0 8)
a 1 16
a 0 (a 1 15)
a 0 (a 0 (a 1 14))
a 0 (a 0 (a 0 (a 1 13)))
a 0 (a 0 (a 0 (a 0 (a 1 12))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 1 11)))))
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 (a 1 10))))))
-- a 1 10 = 1024 (evaluated above)
a 0 (a 0 (a 0 (a 0 (a 0 (a 0 1024)))))
a 0 (a 0 (a 0 (a 0 (a 0 2048))))
a 0 (a 0 (a 0 (a 0 4096)))
a 0 (a 0 (a 0 8192))
a 0 (a 0 16384)
a 0 32768
65536
-}

{- (A 3 3)
a 3 3
a 2 (a 3 2)
a 2 (a 2 (a 3 1))
a 2 (a 2 2)
a 2 (a 1 (a 2 1))
a 2 (a 1 2)
a 2 (a 0 (a 1 1))
a 2 (a 0 2)
a 2 4
-- a 2 4 = 65536 (evaluated above)
65536
-}

-- f x = 0
f :: Int -> Int
f = a 0

-- g x = 2^x
g :: Int -> Int
g = a 1

-- h x = 2^(2^x)
h :: Int -> Int
h = a 2

-- 5n^2
k :: Int -> Int
k n = 5 * n^2
