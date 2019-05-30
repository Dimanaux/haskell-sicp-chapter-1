module Exercise19Spec where

import Test.Hspec
import Exercise19 (fib)

spec :: Spec
spec = do
  describe "fib" $ do
    it "works!" $ do
      fib 0 `shouldBe` 0
      fib 1 `shouldBe` 1
      fib 2 `shouldBe` 1
      fib 3 `shouldBe` 2
      fib 4 `shouldBe` 3
      fib 5 `shouldBe` 5
      fib 6 `shouldBe` 8
      fib 7 `shouldBe` 13
      fib 8 `shouldBe` 21
      fib 9 `shouldBe` 34
