module Exercise03Spec where

import Test.Hspec
import Exercise03 (sumOfSquaresOfTwoMax)

spec :: Spec
spec = do
  describe "sumOfSquaresOfTwoMax" $ do
    it "simple test" $ do
      sumOfSquaresOfTwoMax 2 3 4 `shouldBe` (25 :: Int)

    it "with zero and negatives" $ do
      sumOfSquaresOfTwoMax 0 (-1) (-4) `shouldBe` 1

    it "with equal nums" $ do
      sumOfSquaresOfTwoMax 2 3 3 `shouldBe` (18 :: Int)

    it "with all equal" $ do
      sumOfSquaresOfTwoMax 7 7 7 `shouldBe` 98

    it "with all negatives" $ do
      sumOfSquaresOfTwoMax (-4) (-3) (-9) `shouldBe` 25

    it "sorted positives (ASC)" $ do
      sumOfSquaresOfTwoMax 4 6 13 `shouldBe` 205

    it "sorted positives (DESC)" $ do
      sumOfSquaresOfTwoMax 90 17 2 `shouldBe` 8389

    it "sorted negatives (ASC)" $ do
      sumOfSquaresOfTwoMax (-8) (-3) (-1) `shouldBe` 10
