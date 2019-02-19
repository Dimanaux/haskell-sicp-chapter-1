module Exercise16Spec where

import Test.Hspec
import Exercise16 (fastExpt)

spec :: Spec
spec = do
  describe "fastExpt (iterative)" $ do
    it "works with positive integers" $ do
      fastExpt 3 3 `shouldBe` 27
      fastExpt 3 4 `shouldBe` 81
      fastExpt 3 5 `shouldBe` 243
      fastExpt 0 5 `shouldBe` 0
      fastExpt 2 5 `shouldBe` 32
      fastExpt 2 9 `shouldBe` 512
      fastExpt 7 3 `shouldBe` 343
      fastExpt 5 3 `shouldBe` 125
      fastExpt 9 3 `shouldBe` 729
      fastExpt 10 3 `shouldBe` 1000
      fastExpt 42 0 `shouldBe` 1
      fastExpt 2 12 `shouldBe` 4096
      fastExpt 20 3 `shouldBe` 8000
