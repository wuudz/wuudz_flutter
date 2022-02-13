import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wuudz/wuudz.dart';

class WZMessageGroup extends StatelessWidget {
  final List<WZMessage> messages;
  final bool showTimeHeader;

  const WZMessageGroup({
    Key? key,
    required this.messages,
    this.showTimeHeader = false,
  }) : super(key: key);

  WZMessageUserIconStyle _getIconStyle(BuildContext context) {
    const _defaultStyle = WZMessageUserIconStyle(
      backgroundColor: WZColors.grey20,
      textColor: WZColors.textPrimary,
    );
    
    final themeStyle = WZTheme.of(context).messageTheme?.userIcon;
    return _defaultStyle.merge(themeStyle);
  }

  Widget _renderIcon(BuildContext context) {
    final style = _getIconStyle(context);

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(18),
        color: style.backgroundColor,
      ),
      child: Center(
        child: Text(
          messages.first.sender.name[0],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSent = WZMessageStack.of(context).sender == messages.first.sender.ref;
    
    final alignment = isSent ?
        Alignment.topRight :
        Alignment.topLeft;

    final crossAxisAlignment = isSent ?
        CrossAxisAlignment.end :
        CrossAxisAlignment.start;

    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (showTimeHeader) ...[
            Align(
              alignment: Alignment.topCenter,
              child: WZText.largeBody2(
                Jiffy(messages.first.sentAt).format("dd/MM/yyyy") == Jiffy().format("dd/MM/yyyy") ?
                    Jiffy(messages.first.sentAt).format("hh:mm") :
                    Jiffy(messages.first.sentAt).format("do MMMM yyyy - hh:mm"),
                color: WZColors.grey100,
              ),
            ),
            8.vertical,
          ],
          FractionallySizedBox(
            alignment: alignment,
            widthFactor: 0.7,
            child: Align(
              alignment: alignment,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: isSent ? 0 : 18,
                      top: isSent ? 0 : 24,
                    ),
                    child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      children: [
                        for (final message in messages) ...[
                          message,
                          if (message != messages.last)
                            2.vertical,
                        ]
                      ],
                    ),
                  ),
                  if (!isSent)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: _renderIcon(context),
                    ),
                  if (!isSent)
                    Positioned(
                      top: 4,
                      left: 40,
                      child: WZText.largeBody2(
                        messages.first.sender.name,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}