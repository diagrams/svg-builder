{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts  #-}

-------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Svg.Elements
-- Copyright   :  (c) 2015 Jeffrey Rosenbluth
-- License     :  BSD-style (see LICENSE)
-- Maintainer  :  jeffrey.rosenbluth@gmail.com
--
-- SVG elements.
--
-------------------------------------------------------------------------------

module Graphics.Svg.Elements where

import Graphics.Svg.Core

-- | @DOCTYPE@ element
doctype :: Element
doctype = makeElementDoctype "?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\"\n    \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\""

-- | @svg@ element + svg 1.1 Attribute
svg11_:: Element -> Element
svg11_ = svg_ [ makeAttribute "xmlns" "http://www.w3.org/2000/svg"
              , makeAttribute "xmlns:xlink" "http://www.w3.org/1999/xlink"
              , makeAttribute "version" "1.1" ]

-- | @a@ element
a_ :: Term result => [Attribute] -> result
a_ = term "a"

-- | @altglyph@ element
{-# DEPRECATED altGlyph_ "Removed from web standards." #-}
altGlyph_ :: Term result => [Attribute] -> result
altGlyph_ = term "altGlyph"

-- | @altglyphdef@ element
{-# DEPRECATED altGlyphDef_ "Removed from web standards." #-}
altGlyphDef_ :: Term result => [Attribute] -> result
altGlyphDef_ = term "altGlyphDef"

-- | @altglyphitem@ element
{-# DEPRECATED altGlyphItem_ "Removed from web standards." #-}
altGlyphItem_ :: Term result => [Attribute] -> result
altGlyphItem_ = term "altGlyphItem"

-- | @animate@ element
animate_ :: Term result => [Attribute] -> result
animate_ = term "animate"

-- | @animatecolor@ element
{-# DEPRECATED animateColor_ "Removed from web standards." #-}
animateColor_ :: Term result => [Attribute] -> result
animateColor_ = term "animateColor"

-- | @animatemotion@ element
animateMotion_ :: Term result => [Attribute] -> result
animateMotion_ = term "animateMotion"

-- | @animatetransform@ element
animateTransform_ :: Term result => [Attribute] -> result
animateTransform_ = term "animateTransform"

-- | @circle@ element
circle_ :: Term result => [Attribute] -> result
circle_ = term "circle"

-- | @clipPath@ element or attribute
clipPath_ :: Term result => [Attribute] -> result
clipPath_ = term "clipPath"

-- | @colorProfile@ element
colorProfile_ :: Term result => [Attribute] -> result
colorProfile_ = term "color-profile"

-- | @cursor@ element
cursor_ :: Term result => [Attribute] -> result
cursor_ = term "cursor"

-- | @defs@ element
defs_ :: Term result => [Attribute] -> result
defs_ = term "defs"

-- | @desc@ element
desc_ :: Term result => [Attribute] -> result
desc_ = term "desc"

-- | @ellipse@ element
ellipse_ :: Term result => [Attribute] -> result
ellipse_ = term "ellipse"

-- | @feblend@ element
feBlend_ :: Term result => [Attribute] -> result
feBlend_ = term "feBlend"

-- | @fecolormatrix@ element
feColorMatrix_ :: Term result => [Attribute] -> result
feColorMatrix_ = term "feColorMatrix"

-- | @fecomponenttransfer@ element
feComponentTransfer_ :: Term result => [Attribute] -> result
feComponentTransfer_ = term "feComponentTransfer"

-- | @fecomposite@ element
feComposite_ :: Term result => [Attribute] -> result
feComposite_ = term "feComposite"

-- | @feconvolvematrix@ element
feConvolveMatrix_ :: Term result => [Attribute] -> result
feConvolveMatrix_ = term "feConvolveMatrix"

-- | @fediffuselighting@ element
feDiffuseLighting_ :: Term result => [Attribute] -> result
feDiffuseLighting_ = term "feDiffuseLighting"

-- | @fedisplacementmap@ element
feDisplacementMap_ :: Term result => [Attribute] -> result
feDisplacementMap_ = term "feDisplacementMap"

-- | @fedistantlight@ element
feDistantLight_ :: Term result => [Attribute] -> result
feDistantLight_ = term "feDistantLight"

-- | @feflood@ element
feFlood_ :: Term result => [Attribute] -> result
feFlood_ = term "feFlood"

-- | @fefunca@ element
feFuncA_ :: Term result => [Attribute] -> result
feFuncA_ = term "feFuncA"

-- | @fefuncb@ element
feFuncB_ :: Term result => [Attribute] -> result
feFuncB_ = term "feFuncB"

-- | @fefuncg@ element
feFuncG_ :: Term result => [Attribute] -> result
feFuncG_ = term "feFuncG"

-- | @fefuncr@ element
feFuncR_ :: Term result => [Attribute] -> result
feFuncR_ = term "feFuncR"

-- | @fegaussianblur@ element
feGaussianBlur_ :: Term result => [Attribute] -> result
feGaussianBlur_ = term "feGaussianBlur"

-- | @feimage@ element
feImage_ :: Term result => [Attribute] -> result
feImage_ = term "feImage"

-- | @femerge@ element
feMerge_ :: Term result => [Attribute] -> result
feMerge_ = term "feMerge"

-- | @femergenode@ element
feMergeNode_ :: Term result => [Attribute] -> result
feMergeNode_ = term "feMergeNode"

-- | @femorphology@ element
feMorphology_ :: Term result => [Attribute] -> result
feMorphology_ = term "feMorphology"

-- | @feoffset@ element
feOffset_ :: Term result => [Attribute] -> result
feOffset_ = term "feOffset"

-- | @fepointlight@ element
fePointLight_ :: Term result => [Attribute] -> result
fePointLight_ = term "fePointLight"

-- | @fespecularlighting@ element
feSpecularLighting_ :: Term result => [Attribute] -> result
feSpecularLighting_ = term "feSpecularLighting"

-- | @fespotlight@ element
feSpotLight_ :: Term result => [Attribute] -> result
feSpotLight_ = term "feSpotLight"

-- | @fetile@ element
feTile_ :: Term result => [Attribute] -> result
feTile_ = term "feTile"

-- | @feturbulence@ element
feTurbulence_ :: Term result => [Attribute] -> result
feTurbulence_ = term "feTurbulence"

-- | @filter_@ element
filter_ :: Term result => [Attribute] -> result
filter_ = term "filter"

-- | @font@ element
font_ :: Term result => [Attribute] -> result
font_ = term "font"

-- | @fontFace@ element
fontFace_ :: Term result => [Attribute] -> result
fontFace_ = term "font-face"

-- | @fontFaceFormat@ element
fontFaceFormat_ :: [Attribute] -> Element
fontFaceFormat_ = with $ makeElementNoEnd "font-face-format"

-- | @fontFaceName@ element
fontFaceName_ :: [Attribute] -> Element
fontFaceName_ = with $ makeElementNoEnd "font-face-name"

-- | @fontFaceSrc@ element
fontFaceSrc_ :: Term result => [Attribute] -> result
fontFaceSrc_ = term "font-face-src"

-- | @fontFaceUri@ element
fontFaceUri_ :: Term result => [Attribute] -> result
fontFaceUri_ = term "font-face-uri"

-- | @foreignobject@ element
foreignObject_ :: Term result => [Attribute] -> result
foreignObject_ = term "foreignObject"

-- | @g@ element
g_ :: Term result => [Attribute] -> result
g_ = term "g"

-- | @glyph@ element or attribute
glyph_ :: Term result => [Attribute] -> result
glyph_ = term "glyph"

-- | @glyphref@ element
glyphRef_ :: [Attribute] -> Element
glyphRef_ = with $ makeElementNoEnd "glyphRef"

-- | @hkern@ element
hkern_ :: [Attribute] -> Element
hkern_ = with $ makeElementNoEnd "hkern"

-- | @image@ element
image_ :: Term result => [Attribute] -> result
image_ = term "image"

-- | @line@ element
line_ :: Term result => [Attribute] -> result
line_ = term "line"

-- | @lineargradient@ element
linearGradient_ :: Term result => [Attribute] -> result
linearGradient_ = term "linearGradient"

-- | @marker@ element
marker_ :: Term result => [Attribute] -> result
marker_ = term "marker"

-- | @mask@ element or attribute
mask_ :: Term result => [Attribute] -> result
mask_ = term "mask"

-- | @metadata@ element
metadata_ :: Term result => [Attribute] -> result
metadata_ = term "metadata"

-- | @missingGlyph@ element
missingGlyph_ :: Term result => [Attribute] -> result
missingGlyph_ = term "missing-glyph"

-- | @mpath@ element
mpath_ :: Term result => [Attribute] -> result
mpath_ = term "mpath"

-- | @path@ element
path_ :: Term result => [Attribute] -> result
path_ = term "path"

-- | @pattern@ element
pattern_ :: Term result => [Attribute] -> result
pattern_ = term "pattern"

-- | @polygon@ element
polygon_ :: Term result => [Attribute] -> result
polygon_ = term "polygon"

-- | @polyline@ element
polyline_ :: Term result => [Attribute] -> result
polyline_ = term "polyline"

-- | @radialgradient@ element
radialGradient_ :: Term result => [Attribute] -> result
radialGradient_ = term "radialGradient"

-- | @rect@ element
rect_ :: Term result => [Attribute] -> result
rect_ = term "rect"

-- | @script@ element
script_ :: Term result => [Attribute] -> result
script_ = term "script"

-- | @set@ element
set_ :: Term result => [Attribute] -> result
set_ = term "set"

-- | @stop@ element
stop_ :: Term result => [Attribute] -> result
stop_ = term "stop"

-- | @style@ element
style_ :: Term result => [Attribute] -> result
style_ = term "style"

-- | @svg@ element
svg_ :: Term result => [Attribute] -> result
svg_ = term "svg"

-- | @switch@ element
switch_ :: Term result => [Attribute] -> result
switch_ = term "switch"

-- | @symbol@ element
symbol_ :: Term result => [Attribute] -> result
symbol_ = term "symbol"

-- | @text_@ element
text_ :: Term result => [Attribute] -> result
text_ = term "text"

-- | @textpath@ element
textPath_ :: Term result => [Attribute] -> result
textPath_ = term "textPath"

-- | @title@ element
title_ :: Term result => [Attribute] -> result
title_ = term "title"

-- | @tref@ element
tref_ :: Term result => [Attribute] -> result
tref_ = term "tref"

-- | @tspan@ element
tspan_ :: Term result => [Attribute] -> result
tspan_ = term "tspan"

-- | @use@ element
use_ :: Term result => [Attribute] -> result
use_ = term "use"

-- | @view@ element
view_ :: Term result => [Attribute] -> result
view_ = term "view"

-- | @vkern@ element
vkern_ :: [Attribute] -> Element
vkern_ = with $ makeElementNoEnd "vkern"
