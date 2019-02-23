module Exercise18Spec where

import Test.Hspec
import qualified Exercise18 (fastMul)
import qualified Exercise17Spec (testFastMul)

spec :: Spec
spec = Exercise17Spec.testFastMul Exercise18.fastMul "fastMul iterative"
