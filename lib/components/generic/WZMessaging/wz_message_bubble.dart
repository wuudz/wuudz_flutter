import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:wuudz/wuudz.dart';

typedef WZMessagingBubbleThemeCallback = WZMessagingBubbleTheme Function(BuildContext);

enum WZMessagingBubbleTheme { sent, received }

class WZMessagingBubbleClipper extends CustomClipper<Path> {
  final double height;
  final double width;

  WZMessagingBubbleClipper({
    this.height = 8.0,
    this.width = 16.0
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(width, 0.0)
      ..lineTo(width / 2, height)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(WZMessagingBubbleClipper oldClipper) => oldClipper.width != width || oldClipper.height != height;
}

class WZMessageBubble extends StatelessWidget {
  final WZMessage message;
  final WZMessagingBubbleTheme theme;

  const WZMessageBubble({
    Key? key,
    required this.message,
    required this.theme,
  }) : super(key: key);

  WZMessageBubbleStyle _getStyleFromTheme(BuildContext context) {
    switch (theme) {
      case WZMessagingBubbleTheme.sent:
        return WZTheme.of(context).messagingTheme!.bubbleTheme.sent;
      case WZMessagingBubbleTheme.received:
      default:
        return WZTheme.of(context).messagingTheme!.bubbleTheme.received;
    }
  }

  Widget _content(BuildContext context, WZMessageBubbleStyle style) {
    Widget content;

    switch(message.renderer)
    {
      case WZMessageRenderer.text:
        content = Text(
          message.message,
          textAlign: message.isSent ? TextAlign.right : TextAlign.left,
          textWidthBasis: TextWidthBasis.longestLine,
          style: WZTheme.of(context).textTheme.large.body2?.merge(style.messageStyle)
        );
        break;
      
      case WZMessageRenderer.markdown:
        content = WZMarkdown(
          data: message.message,
          textAlign: message.isSent ? WrapAlignment.end : WrapAlignment.start,
        );
        break;
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    WZMessageBubbleStyle style = _getStyleFromTheme(context);
    bool isSent = message.isSent;

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.icon != null && message.icon is Widget)
            message.icon!,
          if (message.icon != null && message.icon is ImageProvider)
            Image(
              height: 40,
              width: 40,
              image: message.icon!,
            ),
          if (message.icon != null)
            const SizedBox(width: 8,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (message.from != null) ...[
                Text(
                  message.from!,
                  textAlign: isSent ? TextAlign.right : TextAlign.left,
                  style: WZTheme.of(context).textTheme.small.caption?.merge(style.headerStyle),
                ),
                const SizedBox(height: 8,),
              ],
              Container(
                padding: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(
                  maxWidth: 270.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0).subtract(BorderRadius.only(
                    bottomLeft: isSent ? Radius.zero : const Radius.circular(16),
                    bottomRight: isSent ? const Radius.circular(16) : Radius.zero,
                  )),
                  color: style.backgroundColor,
                ),
                child: _content(context, style)
              ),
              if (message.sent != null) ...[
                const SizedBox(height: 8,),
                Text(
                  Jiffy(message.sent).format("MMM dd, yyyy - h:mm a"),
                  textAlign: isSent ? TextAlign.right : TextAlign.left,
                  style: WZTheme.of(context).textTheme.small.caption?.merge(style.footerStyle),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
