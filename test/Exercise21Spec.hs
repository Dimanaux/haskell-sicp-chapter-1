module Exercise21Spec where

import Test.Hspec
import Exercise21 (smallestDivisor)

spec :: Spec
spec = do
  describe "smallestDivisor" $ do
    it "finds smallest divisors of 199, 1999, 19999" $ do
      smallestDivisor 199 `shouldBe` 199
      smallestDivisor 1999 `shouldBe` 1999
      smallestDivisor 19999 `shouldBe` 7

