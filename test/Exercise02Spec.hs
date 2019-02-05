module Exercise02Spec where

import Test.Hspec
import Exercise02 (expression)

-- Exercise02 compiled -> syntax is correct
-- check the value of the expression to ensure semantics
spec :: Spec
spec = do
  describe "expression" $ do
    it "value of expression" $ do
      expression `shouldBe` (-37 / 150)
