{-# LANGUAGE OverloadedStrings #-}

import Graphics.Svg
import Data.Monoid
import Data.Text.Lazy as T

svg :: Element -> Element
svg content =
      doctype
   <> with (svg11_ content) [Width_ <<- "325", Height_ <<- "325"]

contents :: Element
contents =
  path_
    [ D_ <<- (mA 10 80 <> qA 52.5 10 95 80 <> tA 180 80 <> z)
    , Stroke_ <<- "blue"
    , Fill_ <<- "orange"
    ]

main :: IO ()
main = do
  print $ svg contents
