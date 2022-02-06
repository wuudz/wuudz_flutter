import 'package:flutter/material.dart';

import 'package:wuudz/wuudz.dart';

class WZTextThemeData {
  static const normal = WZTextThemeData(
    large: WZTextTheme.gvlarge,
    small: WZTextTheme.gvsmall,
  );

  const WZTextThemeData({
    this.large = const WZTextTheme(),
    this.small = const WZTextTheme(),
  });

  final WZTextTheme large, small;

  WZTextThemeData copyWith({
    WZTextTheme? large,
    WZTextTheme? small,
  }) {
    return WZTextThemeData(
      large: large ?? this.large,
      small: small ?? this.small,
    );
  }

  WZTextThemeData withBaseColor(Color color) {
    return WZTextThemeData(
      large: large.withBaseColor(color),
      small: small.withBaseColor(color),
    );
  }
}

class WZTextTheme {
  static const gvlarge = WZTextTheme(
    xlarge: TextStyle(
      fontFamily: "Visby",
      fontSize: 60,
      height: 72.0/60,
      fontWeight: FontWeight.w800,
      color: WZColors.textPrimary,
    ),
    large: TextStyle(
      fontFamily: "Visby",
      fontSize: 40,
      height: 48.0/40,
      fontWeight: FontWeight.w800,
      color: WZColors.textPrimary,
    ),
    medium: TextStyle(
      fontFamily: "Visby",
      fontSize: 24,
      height: 32.0/24,
      fontWeight: FontWeight.bold,
      color: WZColors.textPrimary,
    ),
    small: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 20,
      height: 32.0/20,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
    heading: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 16,
      height: 24.0/16,
      fontWeight: FontWeight.w600,
      color: WZColors.textPrimary
    ),
    subheading: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 12,
      height: 16.0/12,
      fontWeight: FontWeight.w600,
      color: WZColors.textPrimary
    ),
    button: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 14,
      height: 24.0/14,
      fontWeight: FontWeight.w600,
      color: WZColors.textPrimary
    ),
    body1: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 16,
      height: 24.0/16,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
    body2: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 14,
      height: 24.0/14,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
    caption: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 12,
      height: 16.0/12,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
  );

  static const gvsmall = WZTextTheme(
    xlarge: TextStyle(
      fontFamily: "Visby",
      fontSize: 36,
      height: 40.0/36,
      fontWeight: FontWeight.w800,
      color: WZColors.textPrimary,
    ),
    large: TextStyle(
      fontFamily: "Visby",
      fontSize: 24,
      height: 32.0/24,
      fontWeight: FontWeight.w800,
      color: WZColors.textPrimary,
    ),
    medium: TextStyle(
      fontFamily: "Visby",
      fontSize: 18,
      height: 24.0/18,
      fontWeight: FontWeight.bold,
      color: WZColors.textPrimary,
    ),
    small: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 17,
      height: 24.0/17,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
    heading: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 15,
      height: 24.0/15,
      fontWeight: FontWeight.w600,
      color: WZColors.textPrimary
    ),
    subheading: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 13,
      height: 16.0/13,
      fontWeight: FontWeight.w600,
      color: WZColors.textPrimary
    ),
    button: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 15,
      height: 24.0/15,
      fontWeight: FontWeight.w500,
      color: WZColors.textPrimary
    ),
    body1: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 15,
      height: 24.0/15,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
    body2: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 13,
      height: 16.0/13,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
    caption: TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 12,
      height: 16.0/12,
      fontWeight: FontWeight.normal,
      color: WZColors.textPrimary
    ),
  );
  
  const WZTextTheme({
    this.xlarge,
    this.large,
    this.medium,
    this.small,
    this.heading,
    this.subheading,
    this.button,
    this.body1,
    this.body2,
    this.caption
  });

  final TextStyle? xlarge, large, medium, small, heading, 
                  subheading, button, body1, body2, caption;

  WZTextTheme copyWith({
    TextStyle? xlarge,
    TextStyle? large,
    TextStyle? medium,
    TextStyle? small,
    TextStyle? heading,
    TextStyle? subheading,
    TextStyle? button,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? caption
  }) {
    return WZTextTheme(
      xlarge: xlarge ?? this.xlarge,
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
      heading: heading ?? this.heading,
      subheading: subheading ?? this.subheading,
      button: button ?? this.button,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      caption: caption ?? this.caption,
    );
  }

  WZTextTheme withBaseColor(Color color) {
    return copyWith(
      xlarge: xlarge?.copyWith(
        color: color
      ),
      large: large?.copyWith(
        color: color
      ),
      medium: medium?.copyWith(
        color: color
      ),
      small: small?.copyWith(
        color: color
      ),
      heading: heading?.copyWith(
        color: color
      ),
      subheading: subheading?.copyWith(
        color: color
      ),
      button: button?.copyWith(
        color: color
      ),
      body1: body1?.copyWith(
        color: color
      ),
      body2: body2?.copyWith(
        color: color
      ),
      caption: caption?.copyWith(
        color: color
      ),
    );
  }
}
