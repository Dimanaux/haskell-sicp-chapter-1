module Exercise12Spec where

import Test.Hspec
import Exercise12 (pascalsTriangle)

spec :: Spec
spec = do
  describe "pascalsTriangle" $ do
    it "first row" $ do
      pascalsTriangle 1 1 `shouldBe` 1

    it "second row" $ do
      pascalsTriangle 2 1 `shouldBe` 1
      pascalsTriangle 2 2 `shouldBe` 1

    it "third row" $ do
      pascalsTriangle 3 1 `shouldBe` 1
      pascalsTriangle 3 2 `shouldBe` 2
      pascalsTriangle 3 3 `shouldBe` 1

    it "fourth row" $ do
      pascalsTriangle 4 1 `shouldBe` 1
      pascalsTriangle 4 2 `shouldBe` 3
      pascalsTriangle 4 3 `shouldBe` 3
      pascalsTriangle 4 4 `shouldBe` 1

    it "fifth row" $ do
      pascalsTriangle 5 1 `shouldBe` 1
      pascalsTriangle 5 2 `shouldBe` 4
      pascalsTriangle 5 3 `shouldBe` 6
      pascalsTriangle 5 4 `shouldBe` 4
      pascalsTriangle 5 5 `shouldBe` 1
