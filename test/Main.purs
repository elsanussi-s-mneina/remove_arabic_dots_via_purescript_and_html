module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import ArabicDots (removeDot, removeDots)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "remove diacritic" do 
    it "ب" (removeDot 'ب' `shouldEqual` 'ٮ')
    it "بسش" (removeDots "بسش" `shouldEqual` "ٮسس")
    it "شجرة" (removeDots "شجرة" `shouldEqual` "سحره")
