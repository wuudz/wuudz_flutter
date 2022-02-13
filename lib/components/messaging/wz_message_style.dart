import 'package:flutter/material.dart';

class WZMessageStyle {
  final Color? backgroundColor,
              textColor;
  final Radius? radius;

  const WZMessageStyle({
    this.backgroundColor,
    this.textColor,
    this.radius
  });

  WZMessageStyle merge(WZMessageStyle? other) {
    return WZMessageStyle(
      backgroundColor: other?.backgroundColor ?? backgroundColor,
      textColor: other?.textColor ?? textColor,
      radius: other?.radius ?? radius,
    );
  }
}