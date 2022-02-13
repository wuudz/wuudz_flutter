import 'package:flutter/material.dart';

const double kMinScale = 0.85;
const double kMaxScale = 1.4;

class WZTextScalingLimiter extends StatelessWidget {
  const WZTextScalingLimiter({
    Key? key,
    required this.builder,
    this.min = kMinScale,
    this.max = kMaxScale,
  }) : super(key: key);

  final Widget Function(BuildContext) builder;
  final double min, max;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mqd = MediaQuery.of(context);
    final double newScale = mqd.textScaleFactor.clamp(min, max);

    return MediaQuery(
      data: mqd.copyWith(
        textScaleFactor: newScale,
      ),
      child: Builder(
        builder: builder
      ),
    );
  }
}
