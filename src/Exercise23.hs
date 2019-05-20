module Exercise23 where

{- Exercise 1.23.
-- The smallest-divisor procedure shown at the start of this
-- section does lots of needless testing: After it checks to
-- see if the number is divisible by 2 there is no point in
-- checking to see if it is divisible by any larger even
-- numbers. This suggests that the values used for
-- test-divisor should not be 2, 3, 4, 5, 6, ..., but rather
-- 2, 3, 5, 7, 9, .... To implement this change, define a
-- procedure next that returns 3 if its input is equal to 2
-- and otherwise returns its input plus 2. Modify the
-- smallest-divisor procedure to use (next test-divisor)
-- instead of (+ test-divisor 1). With timed-prime-test
-- incorporating this modified version of smallest-divisor,
-- run the test for each of the 12 primes found in exercise
-- 1.22. Since this modification halves the number of test
-- steps, you should expect it to run about twice as fast.
-- Is this expectation confirmed? If not, what is the
-- observed ratio of the speeds of the two algorithms, and
-- how do you explain the fact that it is different from 2?
-}

-- $ stack runghc -- src/Exercise23.hs
main :: IO ()
main = mapM_ timedPrimeTest [
      1009
    , 1013
    , 1039
    , 10007
    , 10009
    , 10037
    , 1000003
    , 1000033
    , 1000037
    ]
-- don't believe Haskell!
-- 1009 *** 4400
-- 1013 *** 4200
-- 1039 *** 4000
-- 10007 *** 3900
-- 10009 *** 5700
-- 10037 *** 4100
-- 1000003 *** 4700
-- 1000033 *** 4300
-- 1000037 *** 3900

-- next :: (Eq t, Num t) => t -> t
next :: Integral t => t -> t
next 2 = 3
next i = i + 2

divides :: Integral a => a -> a -> Bool
a `divides` b = b `mod` a == 0

findDivisor :: Integral t => t -> t -> t
findDivisor n testDivisor
    | testDivisor^2 > n = n
    | testDivisor `divides` n = testDivisor
    | otherwise = findDivisor n (next testDivisor)

smallestDivisor :: Integral t => t -> t
smallestDivisor n = findDivisor n 2

prime :: Integral t => t -> Bool
prime n = n == smallestDivisor n

timedPrimeTest :: Integer -> IO Bool
timedPrimeTest n = do
    newline
    display n
    currentTime <- runtime
    startPrimeTest n currentTime

startPrimeTest :: Integral t => t -> Integer -> IO Bool
startPrimeTest n startTime = do
    currentTime <- runtime
    if prime n
        then do
            reportPrime (currentTime - startTime)
            return True
        else return False

reportPrime :: Show a => a -> IO ()
reportPrime elapsedTime = do
    putStr " *** "
    display elapsedTime

