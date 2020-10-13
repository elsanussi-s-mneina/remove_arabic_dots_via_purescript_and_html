module ArabicDots where

import Prelude

import Data.Maybe (Maybe(Just, Nothing))
import Data.String.CodeUnits (indexOf, singleton, toCharArray, fromCharArray)
import Data.String.Pattern (Pattern(Pattern))

isIn :: Char -> String -> Boolean
isIn needle haystack = 
  let result = indexOf (Pattern (singleton needle)) haystack
  in case result of 
       Just _ -> true 
       Nothing -> false 
    
removeDot :: Char -> Char
removeDot character =
  case character of 
    _ | isIn character ("آأإٱٲٳٵݳݴ" 
                       ) 
      -> 'ا'
    _ | isIn character ("ݐݑݒݓݔݕݖࢠ" <>
                        "بتث" <>
                        "ټٽ"
                       ) 
      -> 'ٮ'
    _ | isIn character ("ࢢځڂڅݗݘݮݯݲݼ" <> "جحخ")
      -> 'ح'
    _ | isIn character ("دذ" <> "ډڊڋڏڐۮݙݚ")
      -> 'د'
    _ | isIn character ("رز" <> "ڒۯړڔڕږڗڙݛݫݬݱ")
      -> 'ر'
    _ | isIn character ("سش" <>
                        "ښڛڜݜݭݰݽݾۺﺵ"
                       )
      -> 'س'
    _ | isIn character ("صض" <>
                        "ڝڞۻ"
                       )
      -> 'ص'
    _ | isIn character ("طظ" <>
                        "ڟࢣ"
                       )
      -> 'ط'
    _ | isIn character ("عغ" <>
                        "ڠۼݝݞݟ"
                       )
      -> 'ع'
    _ | isIn character ("ف" <>
                        "ࢤڢڣڥݠݡ"
                       ) 
      -> 'ڡ'
    _ | isIn character ("ق" <>
                        "ࢥڧڨ"
                       ) 
      -> 'ٯ'
    _ | isIn character ("ك" <>
                        "ګڬڮݿػؼکݢݣݤڪڭگڰڲڴڱڳڬڮݿګ"
                       )
      -> 'ك'
    _ | isIn character ("ل" <>
                        "ࢦڵڶڷڸݪ"
                       )
      -> 'ل'
    _ | isIn character ("م" <>
                        "ݥݦࢧ"
                       )
      -> 'م'
    _ | isIn character ("ن" <>
                        "ڹڼڽݧڻݨݩں"
                       )
      -> 'ں'
    _ | isIn character ("ةه" <>
                        "ەۂہھۃۀۿ"
                       )
      -> 'ه'

    _ | isIn character ("و" <>
                        "ؤٶۄۊۏݸݹࢫۅﯠﯡۆٷۇۈۉۋ"
    )
      -> 'و'
    _ | isIn character ("يى" <>
                        "ࢨࢩئٸۍێۑݺݻﮮࢬیؽؾؿݵݶݷېےۓ"
                       ) 
      -> 'ى'

    other -> other

removeDots :: String -> String
removeDots aString =
  fromCharArray (map removeDot (toCharArray aString))
  