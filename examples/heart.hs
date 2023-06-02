{-# LANGUAGE OverloadedStrings #-}

import Graphics.Svg
import Data.Monoid
import Data.Text.Lazy as T

svg :: Element -> Element
svg content =
      doctype
   <> with (svg11_ content) [Width_ <<- "100", Height_ <<- "100"]

contents :: Element
contents =path_
  [ Stroke_ <<- "#FF0000"
  , Fill_ <<- "none"
  , D_ <<- (
        mA 10 30
      <> aA 20 20 0 0 1 50 30
      <> aA 20 20 0 0 1 90 30
      <> qA 90 60 50 90
      <> qA 10 60 10 30
      <> z
      )
  ]

main :: IO ()
main = do
  print $ svg contents
