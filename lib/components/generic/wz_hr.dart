import 'package:flutter/material.dart';

class WZHr extends StatelessWidget {
  final String? text;

  const WZHr({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
        if (text != null)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              text!,
              style: Theme.of(context).textTheme.bodyText2
            ),
          ),
        Flexible(
          child: Container(
            height: 1,
            color: Theme.of(context).dividerColor,
          ),
        )
      ],
    );
  }
}
