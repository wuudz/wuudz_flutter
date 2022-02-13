import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wuudz/wuudz.dart';

enum WZMessageType {
  text,
  image,
  video,
  file, 
  voice,
  gif
}

class WZMessageSender {
  final String name;
  final dynamic ref;

  const WZMessageSender({
    required this.name,
    required this.ref,
  });
}

WZMessageStyle _getMessageStyle(BuildContext context, bool sent) {
  WZMessageStyle _defaultStyle;

  if (sent) {
    _defaultStyle = const WZMessageStyle(
      backgroundColor: WZColors.blue500,
      textColor: WZColors.white,
      radius: Radius.circular(12),
    );
  } else {
    _defaultStyle = const WZMessageStyle(
      backgroundColor: WZColors.grey20,
      textColor: WZColors.textPrimary,
      radius: Radius.circular(12),
    );
  }

  final themeStyle = WZTheme.of(context).messageTheme?.sent;
  return _defaultStyle.merge(themeStyle);
}

class WZMessage extends StatelessWidget {
  final String data;
  final WZMessageType type;
  final DateTime sentAt;
  final WZMessageSender sender;

  const WZMessage({
    Key? key,
    required this.data,
    required this.type,
    required this.sentAt,
    required this.sender,
  }) : super(key: key);

  Widget buildBody() {
    switch (type) {
      case WZMessageType.text:
        return WZTextMessage(this);
      case WZMessageType.image:
        return WZImageMessage(this);
      default:
        return const Text("TEST");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: buildBody()
    );
  }
}

class WZTextMessage extends StatelessWidget {
  final WZMessage message;

  const WZTextMessage(this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSent = WZMessageStack.of(context).sender == message.sender.ref;
    final style = _getMessageStyle(context, isSent);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: style.backgroundColor,
      ),
      child: WZText.largeBody1(
        message.data,
        color: style.textColor,
      ),
    );
  }
}

class WZImageMessage extends StatelessWidget {
  final WZMessage message;

  const WZImageMessage(this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stack = WZMessageStack.of(context);
    final isSent = stack.sender == message.sender.ref;
    final style = _getMessageStyle(context, isSent);
    
    return Container(
      decoration: BoxDecoration(
        color: style.backgroundColor,
      ),
      child: FutureBuilder<String>(
        future: () async {
          String url = message.data;
          if (stack.urlResolver != null) {
            String? resolvedUrl = await stack.urlResolver!(url);
            if (resolvedUrl != null) {
              url = resolvedUrl;
            }
          }

          return url;
        }(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          }
          return CachedNetworkImage(
            imageUrl: snapshot.data!,
            cacheKey: message.data,
          );
        },
      ),
    );
  }
}
