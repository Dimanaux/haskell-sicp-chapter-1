module Exercise17Spec
    (
      spec
    , testFastMul
    ) where

import Test.Hspec
import qualified Exercise17 (fastMul)

testFastMul :: (Int -> Int -> Int) -> String -> Spec
testFastMul fastMul description = do
  describe description $ do
    it "works with positive integers" $ do
      fastMul 1 2 `shouldBe` 2
      fastMul 3 2 `shouldBe` 6
      fastMul 3 3 `shouldBe` 9
      fastMul 4 2 `shouldBe` 8
      fastMul 8 2 `shouldBe` 16
      fastMul 3 5 `shouldBe` 15
      fastMul 3 7 `shouldBe` 21
      fastMul 3 8 `shouldBe` 24
      fastMul 3 9 `shouldBe` 27
      fastMul 9 3 `shouldBe` 27
      fastMul 5 2 `shouldBe` 10
      fastMul 8 7 `shouldBe` 56
      fastMul 6 2 `shouldBe` 12
      fastMul 3 13 `shouldBe` 39
      fastMul 12 2 `shouldBe` 24
      fastMul 27 2 `shouldBe` 54
      fastMul 876 7 `shouldBe` 6132
      fastMul 1245 5 `shouldBe` 6225

    it "works with zeroes" $ do
      fastMul 0 24 `shouldBe` 0
      fastMul 25 0 `shouldBe` 0

spec :: Spec
spec = testFastMul Exercise17.fastMul "fastMul recursive"
