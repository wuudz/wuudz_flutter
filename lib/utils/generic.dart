import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void hideKeyboard(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  FocusScope.of(context).unfocus();
}

extension TitleCaseExtension on String {
  String get capitalise => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String toTitleCase() => split(" ").map((str) => str.capitalise).join(" ");
}

extension NumExtensions<T> on num {
  SizedBox get horizontal => SizedBox(width: toDouble(),);
  SizedBox get width => SizedBox(width: toDouble(),);

  SizedBox get vertical => SizedBox(height: toDouble(),);
  SizedBox get height => SizedBox(height: toDouble(),);

  double scaled(BuildContext context) => toDouble() * MediaQuery.of(context).textScaleFactor;
}
