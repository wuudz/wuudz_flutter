import 'package:wuudz/wuudz.dart';

class WZMessageTheme {
  final WZMessageStyle? sent, received;
  final WZMessageUserIconStyle? userIcon;

  const WZMessageTheme({
    this.received,
    this.sent,
    this.userIcon
  });
}