module Exercise22 where

{- Exercise 1.22.
-- Most Lisp implementations include a primitive called
-- runtime that returns an integer that specifies the amount
-- of time the system has been running
-- (measured, for example, in microseconds). The following
-- timed-prime-test procedure, when called with an integer
-- n, prints n and checks to see if n is prime. If n is
-- prime, the procedure prints three asterisks followed by
-- the amount of time used in performing the test.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

-- Using this procedure, write a procedure search-for-primes
-- that checks the primality of consecutive odd integers in
-- a specified range. Use your procedure to find the three
-- smallest primes larger than 1000; larger than 10,000;
-- larger than 100,000; larger than 1,000,000. Note the time
-- needed to test each prime. Since the testing algorithm
-- has order of growth of (n), you should expect that
-- testing for primes around 10,000 should take about 10
-- times as long as testing for primes around 1000. Do your
-- timing data bear this out? How well do the data for
-- 100,000 and 1,000,000 support the n prediction? Is your
-- result compatible with the notion that programs on your
-- machine run in time proportional to the number of steps
-- required for the computation?
-}

-- TODO: answer the questions

-- $ stack runghc -- src/Exercise22.hs
main :: IO ()
main = do
    searchForPrimes 1000 3
    searchForPrimes 10000 3
    searchForPrimes (10^6) 3
    newline
-- numbers are
-- after 1000:
-- 1009 *** 3700
-- 1013 *** 3800
-- 1019 *** 4000
-- after 10 000:
-- 10007 *** 3500
-- 10009 *** 3700
-- 10037 *** 3400
-- after 1 000 000:
-- 1000003 *** 4000
-- 1000033 *** 3600
-- 1000037 *** 4000

-- solution
searchForPrimes :: Integer -> Integer -> IO ()
searchForPrimes _ 0 = return ()
searchForPrimes from count =
    if odd from
        then do
            isPrime <- timedPrimeTest from
            let count' = if isPrime then count - 1 else count
            searchForPrimes (from + 2) count'
        else searchForPrimes (from + 1) count

-- code in Haskell:
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
