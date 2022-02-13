import 'package:flutter/material.dart';

class WZMessageUserIconStyle {
  final Color? backgroundColor,
               textColor;

  const WZMessageUserIconStyle({
    this.backgroundColor,
    this.textColor,
  });

  WZMessageUserIconStyle merge(WZMessageUserIconStyle? other) {
    return WZMessageUserIconStyle(
      backgroundColor: other?.backgroundColor ?? backgroundColor,
      textColor: other?.textColor ?? textColor,
    );
  }
}