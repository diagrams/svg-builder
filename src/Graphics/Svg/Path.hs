{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

-------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Svg.Path
-- Copyright   :  (c) 2015 Jeffrey Rosenbluth
-- License     :  BSD-style (see LICENSE)
-- Maintainer  :  jeffrey.rosenbluth@gmail.com
--
-- Utility functions to help create SVG path attributes,
-- and transforms.
--
-------------------------------------------------------------------------------

module Graphics.Svg.Path where

import           Data.Text                        (Text)
import qualified Data.Text                        as T
import           Data.Text.Lazy                   (toStrict)
import           Data.Text.Lazy.Builder           (toLazyText)
import           Data.Text.Lazy.Builder.RealFloat
import           Data.Text.Lazy.Builder.Int       (decimal)

-- | Convert a number to Text.
toText :: RealFloat a => a -> Text
toText = toStrict . toLazyText . formatRealFloat Fixed (Just 4)

toTextIntegral :: Integral a => a -> Text
toTextIntegral = toStrict . toLazyText . decimal

-- | moveto (absolute)
mA :: RealFloat a =>  a -> a -> Text
mA x y = T.concat ["M " ,toText x, ",", toText y, " "]

-- | moveto (relative)
mR :: RealFloat a =>  a -> a -> Text
mR dx dy = T.concat ["m ", toText dx, ",", toText dy, " "]

-- | lineto (absolute)
lA :: RealFloat a =>  a -> a -> Text
lA x y = T.concat ["L ", toText x, ",", toText y, " "]

-- | lineto (relative)
lR :: RealFloat a =>  a -> a -> Text
lR dx dy = T.concat ["l ", toText dx, ",", toText dy, " "]

-- | horizontal lineto (absolute)
hA :: RealFloat a =>  a -> Text
hA x = T.concat ["H ", toText x, " "]

-- | horizontal lineto (relative)
hR :: RealFloat a =>  a -> Text
hR dx = T.concat ["h ", toText dx, " "]

-- | vertical lineto (absolute)
vA :: RealFloat a =>  a -> Text
vA y = T.concat ["V ", toText y, " "]

-- | vertical lineto (relative)
vR :: RealFloat a =>  a -> Text
vR dy = T.concat ["v ", toText dy, " "]

-- | Cubic Bezier curve (absolute)
cA :: RealFloat a =>  a -> a -> a -> a -> a -> a -> Text
cA c1x c1y c2x c2y x y = T.concat
  [ "C ", toText c1x, ",", toText c1y, " ", toText c2x, ","
  , toText c2y, " ", toText x, " ", toText y]

-- | Cubic Bezier curve (relative)
cR :: RealFloat a =>  a -> a -> a -> a -> a -> a -> Text
cR dc1x dc1y dc2x dc2y dx dy = T.concat
  [ "c ", toText dc1x, ",", toText dc1y, " ", toText dc2x
  , ",", toText dc2y, " ", toText dx, " ", toText dy]

-- | Smooth Cubic Bezier curve (absolute)
sA :: RealFloat a =>  a -> a -> a -> a -> Text
sA c2x c2y x y = T.concat
  ["S ", toText c2x, ",", toText c2y, " ", toText x, ",", toText y, " "]

-- | Smooth Cubic Bezier curve (relative)
sR :: RealFloat a =>  a -> a -> a -> a -> Text
sR dc2x dc2y dx dy = T.concat
  ["s ", toText dc2x, ",", toText dc2y, " ", toText dx, ",", toText dy, " "]

-- | Quadratic Bezier curve (absolute)
qA :: RealFloat a =>  a -> a -> a -> a -> Text
qA cx cy x y = T.concat
  ["Q ", toText cx, ",", toText cy, " ", toText x, ",", toText y, " "]

-- | Quadratic Bezier curve (relative)
qR :: RealFloat a =>  a -> a -> a -> a -> Text
qR dcx dcy dx dy = T.concat
  ["q ", toText dcx, ",", toText dcy, " ", toText dx, ",", toText dy, " " ]

-- | Smooth Quadratic Bezier curve (absolute)
tA  :: RealFloat a =>  a -> a -> Text
tA x y = T.concat ["T ", " ", toText x, ",", toText y, " "]

-- | Smooth Quadratic Bezier curve (relative)
tR :: RealFloat a =>  a -> a -> Text
tR x y = T.concat [ "t ", toText x, ",", toText y, " "]

-- | Arc (absolute)
aA :: (RealFloat a, Integral b) =>  a -> a -> a -> b -> b -> a -> a -> Text
aA rx ry xrot largeFlag sweepFlag x y = T.concat
  [ "A ", toText rx, ",", toText ry, " ", toText xrot, " ", toTextIntegral largeFlag
  , " ", toTextIntegral sweepFlag, " ", toText x, " ", toText y, " "]

-- | Arc (relative)
aR :: (RealFloat a, Integral b) =>  a -> a -> a -> b -> b -> a -> a -> Text
aR rx ry xrot largeFlag sweepFlag x y = T.concat
  [ "a ", toText rx, ",", toText ry, " ", toText xrot, " ", toTextIntegral largeFlag
  , " ", toTextIntegral sweepFlag, " ", toText x, " ", toText y, " "]

-- | closepath
z :: Text
z = "Z"

-- | SVG Transform components
-- | Specifies a translation by @x@ and @y@
translate :: RealFloat a =>  a -> a -> Text
translate x y = T.concat ["translate(", toText x, " ", toText y, ")"]

-- | Specifies a scale operation by @x@ and @y@
scale :: RealFloat a =>  a -> a -> Text
scale x y = T.concat ["scale(", toText x, " ", toText y, ")"]

-- | Specifies a rotation by @rotate-angle@ degrees
rotate :: RealFloat a =>  a -> Text
rotate angle = T.concat ["rotate(", toText angle, ")"]

-- | Specifies a rotation by @rotate-angle@ degrees about the given time @rx,ry@
rotateAround :: RealFloat a =>  a -> a -> a -> Text
rotateAround angle rx ry = T.concat
  ["rotate(", toText angle, ",", toText rx, ",", toText ry, ")"]

-- | Skew tansformation along x-axis
skewX :: RealFloat a =>  a -> Text
skewX angle = T.concat ["skewX(", toText angle, ")"]

-- | Skew tansformation along y-axis
skewY :: RealFloat a =>  a -> Text
skewY angle = T.concat ["skewY(", toText angle, ")"]

-- | Specifies a transform in the form of a transformation matrix
matrix :: RealFloat a =>  a -> a -> a -> a -> a -> a -> Text
matrix a b c d e f =  T.concat
  [ "matrix(", toText a, ",", toText b, ",",  toText c
  , ",",  toText d, ",", toText e, ",",  toText f, ")"]
