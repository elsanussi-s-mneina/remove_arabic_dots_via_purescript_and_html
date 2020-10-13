module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import ArabicDots as ArabicDots

removeDots :: String -> String
removeDots = ArabicDots.removeDots

main :: Effect Unit
main = do
  log "Welcome to the Arabic Dot Remover"
