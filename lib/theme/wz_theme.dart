import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:wuudz/wuudz.dart';

class WZTheme extends StatelessWidget {
  const WZTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final WZThemeData data;
  final Widget child;

  static WZThemeData of(BuildContext context) {
    final InheritedWZTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<InheritedWZTheme>();
    final WZThemeData theme = inheritedTheme!.theme.data;
    return theme;
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWZTheme(
      theme: this,
      child: child,
    );
  }
}

class InheritedWZTheme extends InheritedTheme {
  const InheritedWZTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final WZTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WZTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(InheritedWZTheme oldWidget) => theme.data != oldWidget.theme.data;
}

@immutable
class WZThemeData {
  final WZTextThemeData textTheme;
  final WZMessageTheme? messageTheme;
  final MarkdownStyleSheet? markdownStyle;

  const WZThemeData({
    this.textTheme = WZTextThemeData.normal,
    this.messageTheme,
    this.markdownStyle,
  });

  WZThemeData copyWith({
    WZTextThemeData? textTheme,
    WZMessageTheme? messageTheme,
    MarkdownStyleSheet? markdownStyle,
  }) {
    return WZThemeData(
      textTheme: textTheme ?? this.textTheme,
      messageTheme: messageTheme ?? this.messageTheme,
      markdownStyle: markdownStyle ?? this.markdownStyle,
    );
  }
}
