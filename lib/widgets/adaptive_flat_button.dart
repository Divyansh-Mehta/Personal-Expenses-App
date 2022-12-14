import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class AdaptiveFlatButton extends StatelessWidget {
  final Function handler;
  final String text;

  const AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
          );
  }
}
