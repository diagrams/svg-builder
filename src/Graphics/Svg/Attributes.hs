{-# LANGUAGE OverloadedStrings #-}

-------------------------------------------------------------------------------
-- |
-- Module      :  Graphics.Svg.Attributes
-- Copyright   :  (c) 2015 Jeffrey Rosenbluth
-- License     :  BSD-style (see LICENSE)
-- Maintainer  :  jeffrey.rosenbluth@gmail.com
--
-- SVG Attributes.
--
-------------------------------------------------------------------------------

module Graphics.Svg.Attributes
  ( (<<-)
  , (->>)
  , bindAttr
  , AttrTag(..)
  ) where

import Graphics.Svg.Core
import Data.Text (Text)

-- | Make an 'Attribute' from its value constructor and its text value.
--   by combining an 'AttrTag' with its value.
--
-- > [bindAttr Width "100%, bindAttr Height "100%", bindAttr Fill "red"]
bindAttr :: AttrTag -> Text -> Attribute
bindAttr t v = makeAttribute (tag2text t) v

-- | Infix version of 'bindAttr'
-- Each argument is set using '<<-', the 'bindAttr' function or '->>'.
--
-- > [Width_ <<- "100%", Height_ <<- "100%", Fill_ <<- "red"]
infix 4  <<-
(<<-) :: AttrTag -> Text -> Attribute
(<<-) = bindAttr

-- | Infix version of 'bindAttr' with its arguments reversed.
--
-- > ["100%" ->> Width_, "100%" ->> Height_, "red" ->> Fill_]
infix 4  ->>
(->>) :: Text -> AttrTag -> Attribute
(->>) = flip bindAttr

data AttrTag
  = Accent_height_
  | Accumulate_
  | Additive_
  | Alignment_baseline_
  | Alphabetic_
  | Amplitude_
  | Arabic_form_
  | Ascent_
  | AttributeName_
  | AttributeType_
  | Azimuth_
  | BaseFrequency_
  | Baseprofile_
  | Baseline_shift_
  | Bbox_
  | Begin_
  | Bias_
  | By_
  | CalcMode_
  | Cap_height_
  | Class_
  | Clip_
  | Clip_path_
  | Clip_rule_
  | ClipPathUnits_
  | Color_
  | Color_interpolation_
  | Color_interpolation_filters_
  | Color_profile_
  | Color_rendering_
  | ContentScriptType_
  | ContentStyleType_
  | Cursor_
  | Cx_
  | Cy_
  | D_
  | Descent_
  | DiffuseConstant_
  | Direction_
  | Display_
  | Divisor_
  | Dominant_baseline_
  | Dur_
  | Dx_
  | Dy_
  | EdgeMode_
  | Elevation_
  | Enable_background_
  | End_
  | Exponent_
  | ExternalResourcesRequired_
  | Fill_
  | Fill_opacity_
  | Fill_rule_
  | Filter_
  | FilterRes_
  | FilterUnits_
  | Flood_color_
  | Flood_opacity_
  | Font_family_
  | Font_size_
  | Font_size_adjust_
  | Font_stretch_
  | Font_style_
  | Font_variant_
  | Font_weight_
  | Format_
  | From_
  | Fx_
  | Fy_
  | G1_
  | G2_
  | Glyph_name_
  | Glyph_orientation_horizontal_
  | Glyph_orientation_vertical_
  | GradientTransform_
  | GradientUnits_
  | Hanging_
  | Height_
  | Horiz_adv_x_
  | Horiz_origin_x_
  | Horiz_origin_y_
  | Id_
  | Ideographic_
  | Image_rendering_
  | In_
  | In2_
  | Intercept_
  | K_
  | K1_
  | K2_
  | K3_
  | K4_
  | KernelMatrix_
  | KernelUnitLength_
  | Kerning_
  | KeyPoints_
  | KeySplines_
  | KeyTimes_
  | Lang_
  | LengthAdjust_
  | Letter_spacing_
  | Lighting_color_
  | LimitingConeAngle_
  | Local_
  | Marker_end_
  | Marker_mid_
  | Marker_start_
  | MarkerHeight_
  | MarkerUnits_
  | MarkerWidth_
  | MaskContentUnits_
  | MaskUnits_
  | Mathematical_
  | Max_
  | Media_
  | Method_
  | Min_
  | Mode_
  | Name_
  | NumOctaves_
  | Offset_
  | Onabort_
  | Onactivate_
  | Onbegin_
  | Onclick_
  | Onend_
  | Onerror_
  | Onfocusin_
  | Onfocusout_
  | Onload_
  | Onmousedown_
  | Onmousemove_
  | Onmouseout_
  | Onmouseover_
  | Onmouseup_
  | Onrepeat_
  | Onresize_
  | Onscroll_
  | Onunload_
  | Onzoom_
  | Opacity_
  | Operator_
  | Order_
  | Orient_
  | Orientation_
  | Origin_
  | Overflow_
  | Overline_position_
  | Overline_thickness_
  | Panose_1_
  | Paint_order_
  | Path_
  | PathLength_
  | PatternContentUnits_
  | PatternTransform_
  | PatternUnits_
  | Pointer_events_
  | Points_
  | PointsAtX_
  | PointsAtY_
  | PointsAtZ_
  | PreserveAlpha_
  | PreserveAspectRatio_
  | PrimitiveUnits_
  | R_
  | Radius_
  | RefX_
  | RefY_
  | Rendering_intent_
  | RepeatCount_
  | RepeatDur_
  | RequiredExtensions_
  | RequiredFeatures_
  | Restart_
  | Result_
  | Rotate_
  | Rx_
  | Ry_
  | Scale_
  | Seed_
  | Shape_rendering_
  | Slope_
  | Spacing_
  | SpecularConstant_
  | SpecularExponent_
  | SpreadMethod_
  | StartOffset_
  | StdDeviation_
  | Stemh_
  | Stemv_
  | StitchTiles_
  | Stop_color_
  | Stop_opacity_
  | Strikethrough_position_
  | Strikethrough_thickness_
  | String_
  | Stroke_
  | Stroke_dasharray_
  | Stroke_dashoffset_
  | Stroke_linecap_
  | Stroke_linejoin_
  | Stroke_miterlimit_
  | Stroke_opacity_
  | Stroke_width_
  | Style_
  | SurfaceScale_
  | SystemLanguage_
  | TableValues_
  | Target_
  | TargetX_
  | TargetY_
  | Text_anchor_
  | Text_decoration_
  | Text_rendering_
  | TextLength_
  | To_
  | Transform_
  | Type_
  | U1_
  | U2_
  | Underline_position_
  | Underline_thickness_
  | Unicode_
  | Unicode_bidi_
  | Unicode_range_
  | Units_per_em_
  | V_alphabetic_
  | V_hanging_
  | V_ideographic_
  | V_mathematical_
  | Values_
  | Version_
  | Vert_adv_y_
  | Vert_origin_x_
  | Vert_origin_y_
  | ViewBox_
  | ViewTarget_
  | Visibility_
  | Width_
  | Widths_
  | Word_spacing_
  | Writing_mode_
  | X_
  | X_height_
  | X1_
  | X2_
  | XChannelSelector_
  | XlinkActuate_
  | XlinkArcrole_
  | XlinkHref_
  | XlinkRole_
  | XlinkShow_
  | XlinkTitle_
  | XlinkType_
  | XmlBase_
  | XmlLang_
  | XmlSpace_
  | Y_
  | Y1_
  | Y2_
  | YChannelselector_
  | Z_
  | ZoomAndPan_

-- Link the tags to their svg strings.
tag2text :: AttrTag -> Text
tag2text Accent_height_ = "accent-height"
tag2text Accumulate_ = "accumulate"
tag2text Additive_ = "additive"
tag2text Alignment_baseline_ = "alignment-baseline"
tag2text Alphabetic_ = "alphabetic"
tag2text Amplitude_ = "amplitude"
tag2text Arabic_form_ = "arabic-form"
tag2text Ascent_ = "ascent"
tag2text AttributeName_ = "attributeName"
tag2text AttributeType_ = "attributeType"
tag2text Azimuth_ = "azimuth"
tag2text BaseFrequency_ = "baseFrequency"
tag2text Baseprofile_ = "baseprofile"
tag2text Baseline_shift_ = "baseline-shift"
tag2text Bbox_ = "bbox"
tag2text Begin_ = "begin"
tag2text Bias_ = "bias"
tag2text By_ = "by"
tag2text CalcMode_ = "calcMode"
tag2text Cap_height_ = "cap-height"
tag2text Class_ = "class"
tag2text Clip_ = "clip"
tag2text Clip_path_ = "clip-path"
tag2text Clip_rule_ = "clip-rule"
tag2text ClipPathUnits_ = "clipPathUnits"
tag2text Color_ = "color"
tag2text Color_interpolation_ = "color-interpolation"
tag2text Color_interpolation_filters_ = "color-interpolation-filters"
tag2text Color_profile_ = "color-profile"
tag2text Color_rendering_ = "color-rendering"
tag2text ContentScriptType_ = "contentScriptType"
tag2text ContentStyleType_ = "contentStyleType"
tag2text Cursor_ = "cursor"
tag2text Cx_ = "cx"
tag2text Cy_ = "cy"
tag2text D_ = "d"
tag2text Descent_ = "descent"
tag2text DiffuseConstant_ = "diffuseConstant"
tag2text Direction_ = "direction"
tag2text Display_ = "display"
tag2text Divisor_ = "divisor"
tag2text Dominant_baseline_ = "dominant-baseline"
tag2text Dur_ = "dur"
tag2text Dx_ = "dx"
tag2text Dy_ = "dy"
tag2text EdgeMode_ = "edgeMode"
tag2text Elevation_ = "elevation"
tag2text Enable_background_ = "enable-background"
tag2text End_ = "end"
tag2text Exponent_ = "exponent"
tag2text ExternalResourcesRequired_ = "externalResourcesRequired"
tag2text Fill_ = "fill"
tag2text Fill_opacity_ = "fill-opacity"
tag2text Fill_rule_ = "fill-rule"
tag2text Filter_ = "filter"
tag2text FilterRes_ = "filterRes"
tag2text FilterUnits_ = "filterUnits"
tag2text Flood_color_ = "flood-color"
tag2text Flood_opacity_ = "flood-opacity"
tag2text Font_family_ = "font-family"
tag2text Font_size_ = "font-size"
tag2text Font_size_adjust_ = "font-size-adjust"
tag2text Font_stretch_ = "font-stretch"
tag2text Font_style_ = "font-style"
tag2text Font_variant_ = "font-variant"
tag2text Font_weight_ = "font-weight"
tag2text Format_ = "format"
tag2text From_ = "from"
tag2text Fx_ = "fx"
tag2text Fy_ = "fy"
tag2text G1_ = "g1"
tag2text G2_ = "g2"
tag2text Glyph_name_ = "glyph-name"
tag2text Glyph_orientation_horizontal_ = "glyph-orientation-horizontal"
tag2text Glyph_orientation_vertical_ = "glyph-orientation-vertical"
tag2text GradientTransform_ = "gradientTransform"
tag2text GradientUnits_ = "gradientUnits"
tag2text Hanging_ = "hanging"
tag2text Height_ = "height"
tag2text Horiz_adv_x_ = "horiz-adv-x"
tag2text Horiz_origin_x_ = "horiz-origin-x"
tag2text Horiz_origin_y_ = "horiz-origin-y"
tag2text Id_ = "id"
tag2text Ideographic_ = "ideographic"
tag2text Image_rendering_ = "image-rendering"
tag2text In_ = "in"
tag2text In2_ = "in2"
tag2text Intercept_ = "intercept"
tag2text K_ = "k"
tag2text K1_ = "k1"
tag2text K2_ = "k2"
tag2text K3_ = "k3"
tag2text K4_ = "k4"
tag2text KernelMatrix_ = "kernelMatrix"
tag2text KernelUnitLength_ = "kernelUnitLength"
tag2text Kerning_ = "kerning"
tag2text KeyPoints_ = "keyPoints"
tag2text KeySplines_ = "keySplines"
tag2text KeyTimes_ = "keyTimes"
tag2text Lang_ = "lang"
tag2text LengthAdjust_ = "lengthAdjust"
tag2text Letter_spacing_ = "letter-spacing"
tag2text Lighting_color_ = "lighting-color"
tag2text LimitingConeAngle_ = "limitingConeAngle"
tag2text Local_ = "local"
tag2text Marker_end_ = "marker-end"
tag2text Marker_mid_ = "marker-mid"
tag2text Marker_start_ = "marker-start"
tag2text MarkerHeight_ = "markerHeight"
tag2text MarkerUnits_ = "markerUnits"
tag2text MarkerWidth_ = "markerWidth"
tag2text MaskContentUnits_ = "maskContentUnits"
tag2text MaskUnits_ = "maskUnits"
tag2text Mathematical_ = "mathematical"
tag2text Max_ = "max"
tag2text Media_ = "media"
tag2text Method_ = "method"
tag2text Min_ = "min"
tag2text Mode_ = "mode"
tag2text Name_ = "name"
tag2text NumOctaves_ = "numOctaves"
tag2text Offset_ = "offset"
tag2text Onabort_ = "onabort"
tag2text Onactivate_ = "onactivate"
tag2text Onbegin_ = "onbegin"
tag2text Onclick_ = "onclick"
tag2text Onend_ = "onend"
tag2text Onerror_ = "onerror"
tag2text Onfocusin_ = "onfocusin"
tag2text Onfocusout_ = "onfocusout"
tag2text Onload_ = "onload"
tag2text Onmousedown_ = "onmousedown"
tag2text Onmousemove_ = "onmousemove"
tag2text Onmouseout_ = "onmouseout"
tag2text Onmouseover_ = "onmouseover"
tag2text Onmouseup_ = "onmouseup"
tag2text Onrepeat_ = "onrepeat"
tag2text Onresize_ = "onresize"
tag2text Onscroll_ = "onscroll"
tag2text Onunload_ = "onunload"
tag2text Onzoom_ = "onzoom"
tag2text Opacity_ = "opacity"
tag2text Operator_ = "operator"
tag2text Order_ = "order"
tag2text Orient_ = "orient"
tag2text Orientation_ = "orientation"
tag2text Origin_ = "origin"
tag2text Overflow_ = "overflow"
tag2text Overline_position_ = "overline-position"
tag2text Overline_thickness_ = "overline-thickness"
tag2text Panose_1_ = "panose-1"
tag2text Paint_order_ = "paint-order"
tag2text Path_ = "path"
tag2text PathLength_ = "pathLength"
tag2text PatternContentUnits_ = "patternContentUnits"
tag2text PatternTransform_ = "patternTransform"
tag2text PatternUnits_ = "patternUnits"
tag2text Pointer_events_ = "pointer-events"
tag2text Points_ = "points"
tag2text PointsAtX_ = "pointsAtX"
tag2text PointsAtY_ = "pointsAtY"
tag2text PointsAtZ_ = "pointsAtZ"
tag2text PreserveAlpha_ = "preserveAlpha"
tag2text PreserveAspectRatio_ = "preserveAspectRatio"
tag2text PrimitiveUnits_ = "primitiveUnits"
tag2text R_ = "r"
tag2text Radius_ = "radius"
tag2text RefX_ = "refX"
tag2text RefY_ = "refY"
tag2text Rendering_intent_ = "rendering-intent"
tag2text RepeatCount_ = "repeatCount"
tag2text RepeatDur_ = "repeatDur"
tag2text RequiredExtensions_ = "requiredExtensions"
tag2text RequiredFeatures_ = "requiredFeatures"
tag2text Restart_ = "restart"
tag2text Result_ = "result"
tag2text Rotate_ = "rotate"
tag2text Rx_ = "rx"
tag2text Ry_ = "ry"
tag2text Scale_ = "scale"
tag2text Seed_ = "seed"
tag2text Shape_rendering_ = "shape-rendering"
tag2text Slope_ = "slope"
tag2text Spacing_ = "spacing"
tag2text SpecularConstant_ = "specularConstant"
tag2text SpecularExponent_ = "specularExponent"
tag2text SpreadMethod_ = "spreadMethod"
tag2text StartOffset_ = "startOffset"
tag2text StdDeviation_ = "stdDeviation"
tag2text Stemh_ = "stemh"
tag2text Stemv_ = "stemv"
tag2text StitchTiles_ = "stitchTiles"
tag2text Stop_color_ = "stop-color"
tag2text Stop_opacity_ = "stop-opacity"
tag2text Strikethrough_position_ = "strikethrough-position"
tag2text Strikethrough_thickness_ = "strikethrough-thickness"
tag2text String_ = "string"
tag2text Stroke_ = "stroke"
tag2text Stroke_dasharray_ = "stroke-dasharray"
tag2text Stroke_dashoffset_ = "stroke-dashoffset"
tag2text Stroke_linecap_ = "stroke-linecap"
tag2text Stroke_linejoin_ = "stroke-linejoin"
tag2text Stroke_miterlimit_ = "stroke-miterlimit"
tag2text Stroke_opacity_ = "stroke-opacity"
tag2text Stroke_width_ = "stroke-width"
tag2text Style_ = "style"
tag2text SurfaceScale_ = "surfaceScale"
tag2text SystemLanguage_ = "systemLanguage"
tag2text TableValues_ = "tableValues"
tag2text Target_ = "target"
tag2text TargetX_ = "targetX"
tag2text TargetY_ = "targetY"
tag2text Text_anchor_ = "text-anchor"
tag2text Text_decoration_ = "text-decoration"
tag2text Text_rendering_ = "text-rendering"
tag2text TextLength_ = "textLength"
tag2text To_ = "to"
tag2text Transform_ = "transform"
tag2text Type_ = "type"
tag2text U1_ = "u1"
tag2text U2_ = "u2"
tag2text Underline_position_ = "underline-position"
tag2text Underline_thickness_ = "underline-thickness"
tag2text Unicode_ = "unicode"
tag2text Unicode_bidi_ = "unicode-bidi"
tag2text Unicode_range_ = "unicode-range"
tag2text Units_per_em_ = "units-per-em"
tag2text V_alphabetic_ = "v-alphabetic"
tag2text V_hanging_ = "v-hanging"
tag2text V_ideographic_ = "v-ideographic"
tag2text V_mathematical_ = "v-mathematical"
tag2text Values_ = "values"
tag2text Version_ = "version"
tag2text Vert_adv_y_ = "vert-adv-y"
tag2text Vert_origin_x_ = "vert-origin-x"
tag2text Vert_origin_y_ = "vert-origin-y"
tag2text ViewBox_ = "viewBox"
tag2text ViewTarget_ = "viewTarget"
tag2text Visibility_ = "visibility"
tag2text Width_ = "width"
tag2text Widths_ = "widths"
tag2text Word_spacing_ = "word-spacing"
tag2text Writing_mode_ = "writing-mode"
tag2text X_ = "x"
tag2text X_height_ = "x-height"
tag2text X1_ = "x1"
tag2text X2_ = "x2"
tag2text XChannelSelector_ = "xChannelSelector"
tag2text XlinkActuate_ = "xlink:actuate"
tag2text XlinkArcrole_ = "xlink:arcrole"
tag2text XlinkHref_ = "xlink:href"
tag2text XlinkRole_ = "xlink:role"
tag2text XlinkShow_ = "xlink:show"
tag2text XlinkTitle_ = "xlink:title"
tag2text XlinkType_ = "xlink:type"
tag2text XmlBase_ = "xml:base"
tag2text XmlLang_ = "xml:lang"
tag2text XmlSpace_ = "xml:space"
tag2text Y_ = "y"
tag2text Y1_ = "y1"
tag2text Y2_ = "y2"
tag2text YChannelselector_ = "yChannelSelector"
tag2text Z_ = "z"
tag2text ZoomAndPan_ = "zoomAndPan"
