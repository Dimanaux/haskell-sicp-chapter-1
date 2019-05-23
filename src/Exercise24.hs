module Exercise24 where

{- Exercise 1.24.
-- Modify the timed-prime-test procedure of exercise 1.22 to
-- use fast-prime? (the Fermat method), and test each of the
-- 12 primes you found in that exercise. Since the Fermat
-- test has (log n) growth, how would you expect the time to
-- test primes near 1,000,000 to compare with the time
-- needed to test primes near 1000? Do your data bear this
-- out? Can you explain any discrepancy you find?
-}

-- $ stack runghc -- src/Exercise24.hs
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

timedPrimeTest :: Integer -> IO Bool
timedPrimeTest n = do
    newline
    display n
    currentTime <- runtime
    startPrimeTest n currentTime

startPrimeTest :: Integral t => t -> Integer -> IO Bool
startPrimeTest n startTime = do
    currentTime <- runtime
    if fastPrime n
        then do
            reportPrime (currentTime - startTime)
            return True
        else return False

reportPrime :: Show a => a -> IO ()
reportPrime elapsedTime = do
    putStr " *** "
    display elapsedTime

