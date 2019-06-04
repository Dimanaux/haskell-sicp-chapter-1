import Data.Time.Clock.POSIX


divides :: Integral a => a -> a -> Bool
a `divides` b = b `mod` a == 0

findDivisor :: Integral t => t -> t -> t
findDivisor n testDivisor
    | testDivisor^2 > n = n
    | testDivisor `divides` n = testDivisor
    | otherwise = findDivisor n (testDivisor + 1)

smallestDivisor :: Integral t => t -> t
smallestDivisor n = findDivisor n 2

prime :: Integral t => t -> Bool
prime n = n == smallestDivisor n

-- current time in nanoseconds
-- runtime :: Integral b => IO b
runtime :: IO Integer
runtime = round . (10^6*) <$> getPOSIXTime

newline :: IO ()
newline = putStrLn ""

display :: Show a => a -> IO ()
display a = putStr $ show a

