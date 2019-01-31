module Exercise02Spec where

import Test.Hspec
import Exercise02 (expression)

spec :: Spec
spec = do
  describe "expression" $ do
    it "value of expression" $ do
      expression `shouldBe` (-37 / 150)

