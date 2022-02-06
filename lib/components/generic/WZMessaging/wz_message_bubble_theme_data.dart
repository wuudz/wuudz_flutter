import 'package:flutter/material.dart';
import 'package:wuudz/wuudz.dart';

@immutable
class WZMessageBubbleThemeData {
  final WZMessageBubbleStyle sent;
  final WZMessageBubbleStyle received;

  const WZMessageBubbleThemeData({
    required this.sent,
    required this.received
  });
}
