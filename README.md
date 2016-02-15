svg-builder [![Hackage](https://img.shields.io/hackage/v/lucid-svg.svg?style=flat)](https://hackage.haskell.org/package/svg-builder)
=========
Simple DSL for writing fast SVG.

## Example

``` haskell
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
```

![SVG](http://i.imgur.com/dXu84xR.png)

## Haskell logo

``` haskell
{-# LANGUAGE OverloadedStrings #-}

import Graphics.Svg

svg :: Element -> Element
svg content =
     doctype
  <> with (svg11_ content) [Version_ <<- "1.1", Width_ <<- "482", Height_ <<- "340"]

logo :: Element
logo =
     path_ [ Fill_ <<- "#352950"
           , D_ <<- ( mA 0 340 <> lA 113 170 <> lA 0 0 <> lA 85 0
                   <> lA 198 170 <> lA 85 340 <> lA 0 340 <> z <> mA 0 340 ) ]
  <> path_ [ Fill_ <<- "#4A3A74"
           , D_ <<- ( mA 113 340 <> lA 226 170 <> lA 113 0 <> lA 198 0
                   <> lA 425 340 <> lA 340 340 <> lA 269 234 <> lA 198 340
                   <> lA 113 340 <> z <> mA 113 340 ) ]
  <> path_ [ Fill_ <<- "#7C3679"
           , D_ <<- ( mA 387 241 <> lA 350 184 <> lA 482 184 <> lA 482 241
                   <> lA 387 241 <> z <> mA 387 241 ) ]
  <> path_ [ Fill_ <<- "#7C3679"
           , D_ <<- ( mA 331 156 <> lA 293 99 <> lA 482 99 <> lA 482 156
                   <> lA 331 156 <> z <> mA 331 156 ) ]

main :: IO ()
main = do
  print $ svg logo
```  

![Logo](http://i.imgur.com/tuFExZl.png)
