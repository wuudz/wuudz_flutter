import 'package:flutter/material.dart';

enum WZMessageRenderer {
  text,
  markdown
}

class WZMessage {
  String? id;
  bool isSent;
  String? from;
  String message;
  DateTime? sent;
  bool viewed;

  /// Must be a Widget or an ImageProvider
  dynamic icon;

  static final Map<String, WZMessageRenderer> _rendererMap = {
    "text": WZMessageRenderer.text,
    "markdown": WZMessageRenderer.markdown
  };
  final WZMessageRenderer renderer;

  WZMessage({
    this.id,
    required this.message,
    this.from,
    this.isSent = false, 
    this.sent,
    this.icon,
    this.viewed = false,
    this.renderer = WZMessageRenderer.text
  }) :
    assert(icon == null || icon is ImageProvider || icon is Widget, 
        "icon must be null, a Widget or an ImageProvider");

  WZMessage.fromJson(Map<String, dynamic> data):
    id = data["_id"],
    isSent = data["isSent"] ?? false,
    from = data["from"],
    message = data["message"],
    sent = data["sent"] != null ? DateTime.tryParse(data["sent"]) : null,
    icon = data["icon"] != null ? NetworkImage(data["icon"]) : null,
    viewed = data["viewed"] ?? false,
    renderer = _rendererMap[data["renderer"]] ?? WZMessageRenderer.text;
}
