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
import           Data.Double.Conversion.Convertable (Convertable(toExponential))

-- | Convert a number to Text.
toText :: Convertable a Text => a -> Text
toText = toExponential 4

-- | moveto (absolute)
mA :: Convertable a Text =>  a -> a -> Text
mA x y = T.concat ["M " ,toText x, ",", toText y, " "]

-- | moveto (relative)
mR :: Convertable a Text =>  a -> a -> Text
mR dx dy = T.concat ["m ", toText dx, ",", toText dy, " "]

-- | lineto (absolute)
lA :: Convertable a Text =>  a -> a -> Text
lA x y = T.concat ["L ", toText x, ",", toText y, " "]

-- | lineto (relative)
lR :: Convertable a Text =>  a -> a -> Text
lR dx dy = T.concat ["l ", toText dx, ",", toText dy, " "]

-- | horizontal lineto (absolute)
hA :: Convertable a Text =>  a -> Text
hA x = T.concat ["H ", toText x, " "]

-- | horizontal lineto (relative)
hR :: Convertable a Text =>  a -> Text
hR dx = T.concat ["h ", toText dx, " "]

-- | vertical lineto (absolute)
vA :: Convertable a Text =>  a -> Text
vA y = T.concat ["V ", toText y, " "]

-- | vertical lineto (relative)
vR :: Convertable a Text =>  a -> Text
vR dy = T.concat ["v ", toText dy, " "]

-- | Cubic Bezier curve (absolute)
cA :: Convertable a Text =>  a -> a -> a -> a -> a -> a -> Text
cA c1x c1y c2x c2y x y = T.concat
  [ "C ", toText c1x, ",", toText c1y, " ", toText c2x, ","
  , toText c2y, " ", toText x, " ", toText y]

-- | Cubic Bezier curve (relative)
cR :: Convertable a Text =>  a -> a -> a -> a -> a -> a -> Text
cR dc1x dc1y dc2x dc2y dx dy = T.concat
  [ "c ", toText dc1x, ",", toText dc1y, " ", toText dc2x
  , ",", toText dc2y, " ", toText dx, " ", toText dy]

-- | Smooth Cubic Bezier curve (absolute)
sA :: Convertable a Text =>  a -> a -> a -> a -> Text
sA c2x c2y x y = T.concat
  ["S ", toText c2x, ",", toText c2y, " ", toText x, ",", toText y, " "]

-- | Smooth Cubic Bezier curve (relative)
sR :: Convertable a Text =>  a -> a -> a -> a -> Text
sR dc2x dc2y dx dy = T.concat
  ["s ", toText dc2x, ",", toText dc2y, " ", toText dx, ",", toText dy, " "]

-- | Quadratic Bezier curve (absolute)
qA :: Convertable a Text =>  a -> a -> a -> a -> Text
qA cx cy x y = T.concat
  ["Q ", toText cx, ",", toText cy, " ", toText x, ",", toText y, " "]

-- | Quadratic Bezier curve (relative)
qR :: Convertable a Text =>  a -> a -> a -> a -> Text
qR dcx dcy dx dy = T.concat
  ["q ", toText dcx, ",", toText dcy, " ", toText dx, ",", toText dy, " " ]

-- | Smooth Quadratic Bezier curve (absolute)
tA  :: Convertable a Text =>  a -> a -> Text
tA x y = T.concat ["T ", " ", toText x, ",", toText y, " "]

-- | Smooth Quadratic Bezier curve (relative)
tR :: Convertable a Text =>  a -> a -> Text
tR x y = T.concat [ "t ", toText x, ",", toText y, " "]

-- | Arc (absolute)
aA :: Convertable a Text =>  a -> a -> a -> a -> a -> a -> a -> Text
aA rx ry xrot largeFlag sweepFlag x y = T.concat
  [ "A ", toText rx, ",", toText ry, " ", toText xrot, " ", toText largeFlag
  , " ", toText sweepFlag, " ", toText x, " ", toText y, " "]

-- | Arc (relative)
aR :: Convertable a Text =>  a -> a -> a -> a -> a -> a -> a -> Text
aR rx ry xrot largeFlag sweepFlag x y = T.concat
  [ "a ", toText rx, ",", toText ry, " ", toText xrot, " ", toText largeFlag
  , " ", toText sweepFlag, " ", toText x, " ", toText y, " "]

-- | closepath
z :: Text
z = "Z"

-- | SVG Transform components
-- | Specifies a translation by @x@ and @y@
translate :: Convertable a Text =>  a -> a -> Text
translate x y = T.concat ["translate(", toText x, " ", toText y, ")"]

-- | Specifies a scale operation by @x@ and @y@
scale :: Convertable a Text =>  a -> a -> Text
scale x y = T.concat ["scale(", toText x, " ", toText y, ")"]

-- | Specifies a rotation by @rotate-angle@ degrees
rotate :: Convertable a Text =>  a -> Text
rotate angle = T.concat ["rotate(", toText angle, ")"]

-- | Specifies a rotation by @rotate-angle@ degrees about the given time @rx,ry@
rotateAround :: Convertable a Text =>  a -> a -> a -> Text
rotateAround angle rx ry = T.concat
  ["rotate(", toText angle, ",", toText rx, ",", toText ry, ")"]

-- | Skew tansformation along x-axis
skewX :: Convertable a Text =>  a -> Text
skewX angle = T.concat ["skewX(", toText angle, ")"]

-- | Skew tansformation along y-axis
skewY :: Convertable a Text =>  a -> Text
skewY angle = T.concat ["skewY(", toText angle, ")"]

-- | Specifies a transform in the form of a transformation matrix
matrix :: Convertable a Text =>  a -> a -> a -> a -> a -> a -> Text
matrix a b c d e f =  T.concat
  [ "matrix(", toText a, ",", toText b, ",",  toText c
  , ",",  toText d, ",", toText e, ",",  toText f, ")"]
