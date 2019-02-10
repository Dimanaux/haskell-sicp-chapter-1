module LibrarySpec where

import Test.Hspec
import Control.Exception (evaluate)

import Library (cond)

spec :: Spec
spec = do
  describe "cond" $ do
    it "choose corect" $ do
      cond [(False, 1)
           ,(False, 2)
           ,(True , 3)
           ,(False, 4)] `shouldBe` 3

      cond [(True , 1)
           ,(False, 2)
           ,(False, 3)
           ,(False, 4)] `shouldBe` 1

    it "choose the first between multiple" $ do
      cond [(False, 1)
           ,(False, 2)
           ,(True , 3)
           ,(True , 4)] `shouldBe` 3

    it "lazy evaluation (normal-order)" $ do
      cond [(False, 1 / 0)
           ,(False, 2 / 0)
           ,(True , 3 / 1)
           ,(True , 4 / 0)] `shouldBe` 3

    it "should throw an error" $ do
      evaluate (cond [(False, 1)
           ,(False, 2)
           ,(False, 3)]) `shouldThrow` anyErrorCall
