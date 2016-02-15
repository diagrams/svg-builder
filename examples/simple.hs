{-# LANGUAGE OverloadedStrings #-}

import Graphics.Svg

svg :: Element -> Element
svg content =
     doctype
  <> with (svg11_ content) [Version_ <<- "1.1", Width_ <<- "300", Height_ <<- "200"]

contents :: Element
contents =
     rect_   [ Width_ <<- "100%", Height_ <<- "100%", "red" ->> Fill_]
  <> circle_ [ Cx_ <<- "150", Cy_ <<- "100", R_ <<- "80", Fill_ <<- "green"]
  <> text_   [ X_ <<- "150", Y_ <<- "125", Font_size_ <<- "60"
             , Text_anchor_ <<- "middle", Fill_ <<- "white"] "SVG"

main :: IO ()
main = do
  print $ svg contents
