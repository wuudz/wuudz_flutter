import 'dart:math';

import 'package:flutter/material.dart';

import 'package:wuudz/wuudz.dart';

class WZText extends StatelessWidget {
  const WZText(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = null;

  const WZText.largeXLarge(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.xlarge";

  const WZText.largeLarge(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.large";

  const WZText.largeMedium(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.medium";

  const WZText.largeSmall(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.small";

  const WZText.largeHeading(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.heading";

  const WZText.largeSubheading(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.subheading";

  const WZText.largeButton(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.button";

  const WZText.largeBody1(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.body1";

  const WZText.largeBody2(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.body2";

  const WZText.largeCaption(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "large.caption";

  const WZText.smallXLarge(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.xlarge";

  const WZText.smallLarge(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.large";

  const WZText.smallMedium(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.medium";

  const WZText.smallSmall(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.small";

  const WZText.smallHeading(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.heading";

  const WZText.smallSubheading(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.subheading";

  const WZText.smallButton(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.button";

  const WZText.smallBody1(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.body1";

  const WZText.smallBody2(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.body2";

  const WZText.smallCaption(this.data, {
    this.style,
    this.forceVerticalCenter = false,
    this.color,
    this.textAlign,
    this.maxLines,
  }) :
    _themeStyle = "small.caption";

  final String data;
  final TextStyle? style;
  final bool forceVerticalCenter;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final String? _themeStyle;

  TextStyle? _getStyle(BuildContext context) {
    if (_themeStyle != null) {
      final majorStyle = _themeStyle!.split(".").first;
      final minorStyle = _themeStyle!.split(".").last;

      late WZTextTheme textTheme;
      if (majorStyle == "large") {
        textTheme = WZTheme.of(context).textTheme.large;
      } else {
        textTheme = WZTheme.of(context).textTheme.small;
      }

      late TextStyle themeStyle;
      switch (minorStyle) {
        case "xlarge":
          themeStyle = textTheme.xlarge!;
          break;
        case "large":
          themeStyle = textTheme.large!;
          break;
        case "medium":
          themeStyle = textTheme.medium!;
          break;
        case "small":
          themeStyle = textTheme.small!;
          break;
        case "heading":
          themeStyle = textTheme.heading!;
          break;
        case "subheading":
          themeStyle = textTheme.subheading!;
          break;
        case "button":
          themeStyle = textTheme.button!;
          break;
        case "body1":
          themeStyle = textTheme.body1!;
          break;
        case "body2":
          themeStyle = textTheme.body2!;
          break;
        case "caption":
          themeStyle = textTheme.caption!;
          break;
      }

      return themeStyle.merge(style).copyWith(color: color);
    }

    return style;
  } 

  @override
  Widget build(BuildContext context) {
    final style = _getStyle(context);

    Widget text = Text(
      data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      strutStyle: forceVerticalCenter ? 
          StrutStyle(
            fontSize: style!.fontSize,
            height: 1,
            forceStrutHeight: true,
          ) : 
          null,
    );

    if (forceVerticalCenter) {
      final half = max(1, (style!.height! - 1) * style.fontSize!) / 2;
      final padding = EdgeInsets.symmetric(vertical: half.roundToDouble());

      text = Padding(
        padding: padding,
        child: text,
      );
    }

    return text;
  }
}
