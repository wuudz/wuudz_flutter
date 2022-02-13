import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wuudz/wuudz.dart';

typedef WZMessageStackUrlResolver = FutureOr<String?> Function(String);

class WZMessageStack extends StatefulWidget {
  final List<WZMessageGroup> groups;
  final WZMessageStackUrlResolver? urlResolver;
  final dynamic sender;

  const WZMessageStack({
    Key? key,
    required this.groups,
    this.urlResolver,
    this.sender,
  }) : super(key: key);

  static WZMessageStack of(BuildContext context) {
    final InheritedWZMessageStack? inheritedTheme = context.dependOnInheritedWidgetOfExactType<InheritedWZMessageStack>();
    return inheritedTheme!.stack;
  }

  @override
  _WZMessageStackState createState() => _WZMessageStackState();
}

class _WZMessageStackState extends State<WZMessageStack> {
  @override
  Widget build(BuildContext context) {
    return InheritedWZMessageStack(
      stack: widget,
      child: Column(
        children: [
          for (final group in widget.groups) ...[
            group,
            if (group != widget.groups.last)
              16.vertical,
          ],
        ],
      ),
    );
  }
}

class InheritedWZMessageStack extends InheritedTheme {
  const InheritedWZMessageStack({
    Key? key,
    required this.stack,
    required Widget child,
  }) : super(key: key, child: child);

  final WZMessageStack stack;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WZMessageStack(
      groups: stack.groups,
      urlResolver: stack.urlResolver,
      sender: stack.sender, 
    );
  }

  @override
  bool updateShouldNotify(InheritedWZMessageStack oldWidget) => stack != oldWidget.stack;
}

