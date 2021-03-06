module Exercise01
    (
      main
    ) where

import Library

{- Exercise 1.1.
-- Below is a sequence of expressions. What is the result
-- printed by the interpreter in response to each expression?
-- Assume that the sequence is to be evaluated in the order
-- in which it is presented.
-}

{- NOTE prefix notation is not being used in Haskell
-- arithmetic operations
-- to use operation as a function, we should wrap it
-- with braces: (+) 3 4
-- but it is a function taking exactly 2 arguments!
-}

-- !NOTE run via $ stack runghc -- src/Exercise01.hs

main :: IO ()
main = do
    print 10 -- 10
    -- print (5 + 3 + 4)
    print ((+) 5 ((+) 3 4)) -- 12
    -- print (9 - 1)
    print ((-) 9 1) -- 8
    -- print ((2 + 4) * (4 - 6))
    print ((+) ((*) 2 4) ((-) 4 6)) -- 6
    let a = 3
    -- let b = a + 1
    let b = (+) a 1
    -- print (a + b + a * b)
    print ((+) a ((+) b ((*) a b))) -- 19
    -- print (a == b)
    print ((==) a b) -- False
    -- if b > a && b < a * b then b else a
    print (if ((&&) ((>) b a) ((<) b ((*) a b))) then b else a) -- 4
    -- there is no such statement COND in Haskell, but we can create a
    -- function cond, that takes a list of pairs (condition, expression)
    -- doing the same
    -- cond [(a == 4   , 6        )
    --      ,(b == 4   , 6 + 7 + a)
    --      ,(otherwise, 0        )]
    print (cond [((==) a 4 , 6                 )
                ,((==) b 4 , ((+) 6 ((+) 7 a)) )
                ,(otherwise, 0                 ) ]) -- 16
    -- (cond [(a > b    , a )
    --       ,(a < b    , b )
    --       ,(otherwise, -1)]) * (a + 1)
    print ((*) (cond [((>) a b  , a )
                     ,((<) a b  , b )
                     ,(otherwise, -1)])
               ((+) a 1)) -- 16
