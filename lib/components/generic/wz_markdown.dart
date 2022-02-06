import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wuudz/wuudz.dart';

class WZMarkdown extends StatelessWidget {
  const WZMarkdown({
    Key? key,
    this.data = "",
    this.style,
    this.textAlign = WrapAlignment.start
  }) : super(key: key);

  final String data;
  final MarkdownStyleSheet? style;
  final WrapAlignment textAlign;

  MarkdownStyleSheet _getStyle(BuildContext context) {
    final textTheme = WZTheme.of(context).textTheme;

    final defaultStyle = MarkdownStyleSheet(
      blockSpacing: 16,
      textAlign: textAlign,
      h1: textTheme.large.large,
      h2: textTheme.large.medium,
      h3: textTheme.large.small,
      h4: textTheme.large.heading,
      h5: textTheme.large.subheading,
      h6: textTheme.small.medium,
      p: textTheme.large.body1,
      tableHead: textTheme.large.heading,
      tableBody: textTheme.large.body1,
      listIndent: 20,
      listBullet: textTheme.large.body1,
      listBulletPadding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      code: textTheme.small.body1,
      codeblockDecoration: const BoxDecoration(
        color: WZColors.grey25,
      ),
      blockquote: textTheme.large.body1,
      blockquoteDecoration: const BoxDecoration(
        color: WZColors.grey25,
      ),
      blockquotePadding: const EdgeInsets.all(16),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
    ); 

    final baseStyle = MarkdownStyleSheet.fromTheme(Theme.of(context)).merge(defaultStyle);
    final themeStyle = baseStyle.merge(WZTheme.of(context).markdownStyle);
    final localStyle = themeStyle.merge(style);

    return localStyle;
  }

  @override
  Widget build(BuildContext context) {
    final style = _getStyle(context);

    return MarkdownBody(
      data: data,
      styleSheet: style,
      selectable: true,
      listItemCrossAxisAlignment: MarkdownListItemCrossAxisAlignment.start,
      bulletBuilder: (i, type) {
        if (type == BulletStyle.unorderedList) {
          return Padding(
            padding: style.listBulletPadding!,
            child: Text(
              '•',
              textAlign: TextAlign.left,
              style: style.listBullet,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          );
        }

        return Text(
          '${i + 1}.',
          textAlign: TextAlign.right,
          style: style.listBullet,
          overflow: TextOverflow.visible,
        );
      },
      onTapLink: (text, href, title) {
        if (href != null) {
          Uri? uri = Uri.tryParse(href);
          if (uri == null || uri.scheme == "") {
            final isRootNav = href.startsWith("/");
            final name = "${isRootNav ? '' : '/'}$href";
            Navigator.of(context, rootNavigator: isRootNav).pushNamed(name);
          } else {
            launch(href);
          }
        }
      },
    );
  }
}
