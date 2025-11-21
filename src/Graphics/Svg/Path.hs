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

import           Data.Ratio
import           Data.String                      (fromString)
import           Data.Text                        (Text)
import qualified Data.Text                        as T

-- | Convert a number to Text.
toText :: Real a => a -> Text
toText = formatReal 4

formatReal :: Real n => Word -> n -> Text
formatReal precission n =
  let rat = toRational n
      num = numerator rat
      den = denominator rat
      val = (num * (10 ^ precission)) `div` den
      digits = show val
      len = length digits
      (whole, frac) = splitAt (len - fromEnum precission) digits
      wholeNums = case whole of
        [] -> "0"
        xs -> xs
      fracNums =
        let m = length frac
        in  frac <> replicate (max 0 (4 - m)) '0'
      str = wholeNums <> "." <> fracNums
  in  fromString str

-- | moveto (absolute)
mA :: Real a =>  a -> a -> Text
mA x y = T.concat ["M " ,toText x, ",", toText y, " "]

-- | moveto (relative)
mR :: Real a =>  a -> a -> Text
mR dx dy = T.concat ["m ", toText dx, ",", toText dy, " "]

-- | lineto (absolute)
lA :: Real a =>  a -> a -> Text
lA x y = T.concat ["L ", toText x, ",", toText y, " "]

-- | lineto (relative)
lR :: Real a =>  a -> a -> Text
lR dx dy = T.concat ["l ", toText dx, ",", toText dy, " "]

-- | horizontal lineto (absolute)
hA :: Real a =>  a -> Text
hA x = T.concat ["H ", toText x, " "]

-- | horizontal lineto (relative)
hR :: Real a =>  a -> Text
hR dx = T.concat ["h ", toText dx, " "]

-- | vertical lineto (absolute)
vA :: Real a =>  a -> Text
vA y = T.concat ["V ", toText y, " "]

-- | vertical lineto (relative)
vR :: Real a =>  a -> Text
vR dy = T.concat ["v ", toText dy, " "]

-- | Cubic Bezier curve (absolute)
cA :: Real a =>  a -> a -> a -> a -> a -> a -> Text
cA c1x c1y c2x c2y x y = T.concat
  [ "C ", toText c1x, ",", toText c1y, " ", toText c2x, ","
  , toText c2y, " ", toText x, " ", toText y]

-- | Cubic Bezier curve (relative)
cR :: Real a =>  a -> a -> a -> a -> a -> a -> Text
cR dc1x dc1y dc2x dc2y dx dy = T.concat
  [ "c ", toText dc1x, ",", toText dc1y, " ", toText dc2x
  , ",", toText dc2y, " ", toText dx, " ", toText dy]

-- | Smooth Cubic Bezier curve (absolute)
sA :: Real a =>  a -> a -> a -> a -> Text
sA c2x c2y x y = T.concat
  ["S ", toText c2x, ",", toText c2y, " ", toText x, ",", toText y, " "]

-- | Smooth Cubic Bezier curve (relative)
sR :: Real a =>  a -> a -> a -> a -> Text
sR dc2x dc2y dx dy = T.concat
  ["s ", toText dc2x, ",", toText dc2y, " ", toText dx, ",", toText dy, " "]

-- | Quadratic Bezier curve (absolute)
qA :: Real a =>  a -> a -> a -> a -> Text
qA cx cy x y = T.concat
  ["Q ", toText cx, ",", toText cy, " ", toText x, ",", toText y, " "]

-- | Quadratic Bezier curve (relative)
qR :: Real a =>  a -> a -> a -> a -> Text
qR dcx dcy dx dy = T.concat
  ["q ", toText dcx, ",", toText dcy, " ", toText dx, ",", toText dy, " " ]

-- | Smooth Quadratic Bezier curve (absolute)
tA  :: Real a =>  a -> a -> Text
tA x y = T.concat ["T ", " ", toText x, ",", toText y, " "]

-- | Smooth Quadratic Bezier curve (relative)
tR :: Real a =>  a -> a -> Text
tR x y = T.concat [ "t ", toText x, ",", toText y, " "]

-- | Arc (absolute)
aA :: Real a =>  a -> a -> a -> a -> a -> a -> a -> Text
aA rx ry xrot largeFlag sweepFlag x y = T.concat
  [ "A ", toText rx, ",", toText ry, " ", toText xrot, " ", toText largeFlag
  , " ", toText sweepFlag, " ", toText x, " ", toText y, " "]

-- | Arc (relative)
aR :: Real a =>  a -> a -> a -> a -> a -> a -> a -> Text
aR rx ry xrot largeFlag sweepFlag x y = T.concat
  [ "a ", toText rx, ",", toText ry, " ", toText xrot, " ", toText largeFlag
  , " ", toText sweepFlag, " ", toText x, " ", toText y, " "]

-- | closepath
z :: Text
z = "Z"

-- | SVG Transform components
-- | Specifies a translation by @x@ and @y@
translate :: Real a =>  a -> a -> Text
translate x y = T.concat ["translate(", toText x, " ", toText y, ")"]

-- | Specifies a scale operation by @x@ and @y@
scale :: Real a =>  a -> a -> Text
scale x y = T.concat ["scale(", toText x, " ", toText y, ")"]

-- | Specifies a rotation by @rotate-angle@ degrees
rotate :: Real a =>  a -> Text
rotate angle = T.concat ["rotate(", toText angle, ")"]

-- | Specifies a rotation by @rotate-angle@ degrees about the given time @rx,ry@
rotateAround :: Real a =>  a -> a -> a -> Text
rotateAround angle rx ry = T.concat
  ["rotate(", toText angle, ",", toText rx, ",", toText ry, ")"]

-- | Skew tansformation along x-axis
skewX :: Real a =>  a -> Text
skewX angle = T.concat ["skewX(", toText angle, ")"]

-- | Skew tansformation along y-axis
skewY :: Real a =>  a -> Text
skewY angle = T.concat ["skewY(", toText angle, ")"]

-- | Specifies a transform in the form of a transformation matrix
matrix :: Real a =>  a -> a -> a -> a -> a -> a -> Text
matrix a b c d e f =  T.concat
  [ "matrix(", toText a, ",", toText b, ",",  toText c
  , ",",  toText d, ",", toText e, ",",  toText f, ")"]
