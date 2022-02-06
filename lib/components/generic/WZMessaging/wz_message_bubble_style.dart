import 'package:flutter/material.dart';

@immutable
class WZMessageBubbleStyle {
  final TextStyle? headerStyle, messageStyle, footerStyle;
  final Color? backgroundColor;

  const WZMessageBubbleStyle({
    this.headerStyle,
    this.messageStyle,
    this.footerStyle,
    required this.backgroundColor,
  });
}
