import 'package:flutter/material.dart';

import 'package:visibility_detector/visibility_detector.dart';
import 'package:wuudz/wuudz.dart';


class WZMessagingStack extends StatelessWidget {
  final List<WZMessage> messages;
  final bool seperators;
  final void Function(WZMessage)? onMessageViewed;

  WZMessagingStack({
    Key? key,
    required this.messages,
    this.seperators = false,
    this.onMessageViewed,
  }) : super(key: key) {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          ...messages
            .map((m) => [
              VisibilityDetector(
                key: m.id != null ? Key("message-${m.id}") : UniqueKey(),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (onMessageViewed != null && m.viewed == false && info.visibleFraction > 0.5) {
                    onMessageViewed!(m);
                  }
                },
                child: WZMessageBubble(
                  theme: m.isSent
                    ? WZMessagingBubbleTheme.sent
                    : WZMessagingBubbleTheme.received,
                  message: m
                ),
              ),
              if (m != messages.last && seperators) ...[
                const SizedBox(height: 24,),
                const WZHr(),
                const SizedBox(height: 24,),
              ],
              if (m != messages.last && !seperators)
                const SizedBox(height: 8,)
            ])
            .expand((a) => a)
            .toList(),
          const SizedBox(height: 24),
        ]
      ),
    );
  }
}
