module Exercise05Spec where

import Test.Hspec
import Exercise05 (test, p)

spec :: Spec
spec = do
  describe "test 0 p, where p = p" $ do
    it "should return 0, not loop" $ do
      test 0 p `shouldBe` 0
