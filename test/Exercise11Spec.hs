module Exercise11Spec where

import Test.Hspec
import Exercise11 (f, f')

spec :: Spec
spec = do
  describe "f recursive" $ do
    it "implemented well" $ do
      f 0 `shouldBe` 0
      f 1 `shouldBe` 1
      f 2 `shouldBe` 2
      f 3 `shouldBe` 4
      f 4 `shouldBe` 11
      f 5 `shouldBe` 25
      f 6 `shouldBe` 59
      f 7 `shouldBe` 59 + 25 * 2 + 11 * 3
      f 8 `shouldBe` f 7 + 2 * f 6 + 3 * f 5

  describe "f iterative" $ do
    it "should match f recursive if f recursive is correct" $ do
       f' 0 `shouldBe` f 0
       f' 1 `shouldBe` f 1
       f' 2 `shouldBe` f 2
       f' 3 `shouldBe` f 3
       f' 4 `shouldBe` f 4
       f' 5 `shouldBe` f 5
       f' 6 `shouldBe` f 6
       f' 7 `shouldBe` f 7
       f' 8 `shouldBe` f 8
       f' 9 `shouldBe` f 9
       f' 10 `shouldBe` f 10
       f' 11 `shouldBe` f 11
