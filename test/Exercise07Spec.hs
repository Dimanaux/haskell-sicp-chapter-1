module Exercise07Spec where

import Test.Hspec
import Exercise07 (sqrt', badSqrt, approximately)

spec :: Spec
spec = do
  describe "sqrt'" $ do
    it "works with regular numbers" $ do
      sqrt' 9 `shouldSatisfy` approximately 3
      sqrt' 16 `shouldSatisfy` approximately 4

    it "works with tiny numbers" $ do
      sqrt' 0.0009 `shouldSatisfy` approximately 0.03
      sqrt' 0.0001 `shouldSatisfy` approximately 0.01

  describe "badSqrt" $ do
    it "works with regular numbers" $ do
      badSqrt 9 `shouldSatisfy` approximately 3
      badSqrt 4 `shouldSatisfy` approximately 2

    {-
    -- fails
    it "works with tiny numbers" $ do
      badSqrt 0.0009 `shouldSatisfy` approximately 0.03
      badSqrt 0.0004 `shouldSatisfy` approximately 0.02
    -- even maybe
    it "doesn't work with tiny numbers" $ do
      badSqrt 0.0009 `shouldSatisfy` (not . approximately 0.03)
    -}

  describe "sqrt' comparing to badSqrt" $ do
    it "sqrt' should be more accurate than badSqrt" $ do
      shouldSatisfy (abs (3 - sqrt' (3^2)))
                    (<= (abs (3 - badSqrt (3^2))))
      shouldSatisfy (abs (1000 - sqrt' (1000^2)))
                    (<= (abs (1000 - badSqrt (1000^2))))
      shouldSatisfy (abs (0.007 - sqrt' (0.007^2)))
                    (<= (abs (0.007 - badSqrt (0.007^2))))
