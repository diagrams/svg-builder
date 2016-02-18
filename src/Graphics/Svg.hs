{-# LANGUAGE OverloadedStrings       #-}

{-# OPTIONS -fno-warn-unused-imports #-}

-------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Svg
-- Copyright   :  (c) 2015 Jeffrey Rosenbluth
-- License     :  BSD-style (see LICENSE)
-- Maintainer  :  jeffrey.rosenbluth@gmail.com
--
-- DSL for creating SVG.
--
-------------------------------------------------------------------------------
module Graphics.Svg
  ( -- * Intro
    -- $intro
    -- * Re-exports
    module Graphics.Svg.Core
  , module Graphics.Svg.Path
  , module Graphics.Svg.Elements
  , module Graphics.Svg.Attributes
  , (<>)
  -- * Rendering
  , prettyText
  ) where

import           Data.Int               (Int64)
import           Data.Monoid
import           Data.Text.Lazy         as LT
import           Data.Text.Lazy.Builder as B
import           Graphics.Svg.Core
import           Graphics.Svg.Attributes
import           Graphics.Svg.Elements
import           Graphics.Svg.Path

prettyText :: Element -> Text
prettyText svg = B.toLazyText $ LT.foldr go mempty text Nothing (-1)
  where
    text = renderText svg
    go c f Nothing n
      | c == '<' || c == '/' = f (Just c) n
    go c f (Just '<') n
      | c == '?' = "<?" <> f Nothing n
      | c == '!' = "<!" <> f Nothing n
      | c == '/' = "\n"
                    <> (B.fromLazyText $ LT.replicate n "  " )
                    <> "</"
                    <> f Nothing (n-1)
      | otherwise = "\n"
                    <> (B.fromLazyText $ LT.replicate (n+1)   "  " )
                    <> "<"
                    <> B.singleton c
                    <> f Nothing (n+1)
    go '>' f (Just _) n = "/>" <> f Nothing (n-1)
    go c f s n =  s' <> B.singleton c <> f Nothing n
      where  s' = maybe mempty B.singleton s

-- $intro
--
-- SVG elements in Graphics-Svg are written with a postfix ‘@_@’.
-- Some examples:
--
-- 'path_', 'circle_', 'color_', 'scale_'
--
-- Plain text is written using the @OverloadedStrings@
-- extension, and is automatically escaped:
--
-- As in Graphics, elements nest by function application (unlike Graphics, there
-- is no Monad instance for 'Element's and an 'Attribute' list is always required):
--
-- >>> g_ [] (text_ [] "Hello SVG")
-- <g><text>Hello SVG</text></g>
--
-- and elements are juxtaposed via monoidal append:
--
-- >>> text_ [] "Hello" <> text_ [] "SVG"
-- <text>Hello</text><text>SVG</text>
--
-- Attributes are set by providing an argument list. Each argument is set
-- using the 'bindAttr' function or operators, '<<-' and '->>'.
--
-- >>> rect_ [Width_ <<- "100%", Height_ <<- "100%", "red" ->> Fill_]
-- <rect height="100%" width="100%" fill="red"></rect>
--
-- Path data can be constructed using the functions in 'Graphics.Svg.Path'
-- and combined monoidally:
--
-- @
-- path_
--   [ D_ <<- (mA 10 80 <> qA 52.5 10 95 80 <> tA 180 80 <> z)
--   , Stroke_ <<- "blue"
--   , Fill_ <<- "orange"
--   ]
-- @
-- > <path d="M 10,80 Q 52.5,10 95,80 T 180,80 Z" stroke="blue" fill="orange"/>
--
-- __A slightly longer example__
--
-- > import Graphics.Svg
-- >
-- > svg :: Element -> Element
-- > svg content =
-- >      doctype
-- >   <> with (svg11_ content) [Version_ <<- "1.1", Width_ <<- "300" , Height_ <<- "200"]
-- >
-- > contents :: Element
-- > contents =
-- >      rect_ [Width_ <<- "100%", Height_ <<- "100%", Fill_ <<- "red"]
-- >   <> circle_ [Cx_ <<- "150", Cy_ <<- "100", R_ <<- "80", Fill_ <<- "green"]
-- >   <> text_ [ X_ <<- "150", Y_ <<- "125", FontSize_ <<- "60"
-- >            , TextAnchor_ <<- "middle", Fill_ <<- "white" ] "SVG"
-- >
-- >
-- > main :: IO ()
-- > main = do
-- >   print $ svg contents
-- <<http://i.imgur.com/dXu84xR.png>>
--
-- __The haskell logo__
--
-- > {-# LANGUAGE OverloadedStrings #-}
-- >
-- > import Graphics.Svg
-- >
-- > svg :: Element -> Element
-- > svg content =
-- >      doctype
-- >   <> with (svg11_ content) [Version_ <<- "1.1", Width_ <<- "482", Height_ <<- "340"]
-- >
-- > logo :: Element
-- > logo =
-- >      path_ [ Fill_ <<- "#352950"
-- >            , D_ <<- ( mA 0 340 <> lA 113 170 <> lA 0 0 <> lA 85 0
-- >                    <> lA 198 170 <> lA 85 340 <> lA 0 340 <> z <> mA 0 340 ) ]
-- >   <> path_ [ Fill_ <<- "#4A3A74"
-- >            , D_ <<- ( mA 113 340 <> lA 226 170 <> lA 113 0 <> lA 198 0
-- >                    <> lA 425 340 <> lA 340 340 <> lA 269 234 <> lA 198 340
-- >                    <> lA 113 340 <> z <> mA 113 340 ) ]
-- >   <> path_ [ Fill_ <<- "#7C3679"
-- >            , D_ <<- ( mA 387 241 <> lA 350 184 <> lA 482 184 <> lA 482 241
-- >                    <> lA 387 241 <> z <> mA 387 241 ) ]
-- >   <> path_ [ Fill_ <<- "#7C3679"
-- >            , D_ <<- ( mA 331 156 <> lA 293 99 <> lA 482 99 <> lA 482 156
-- >                    <> lA 331 156 <> z <> mA 331 156 ) ]
-- >
-- > main :: IO ()
-- > main = do
-- >   print $ svg logo
-- <<http://i.imgur.com/tuFExZl.png>>
