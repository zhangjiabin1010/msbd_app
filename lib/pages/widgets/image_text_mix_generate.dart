import 'package:flutter/material.dart';

InlineSpan ImageTextMixGenerate(context, item) {
  if (item.contains('.png')) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.top,
      child: Image.asset(item),
    );
  } else {
    return TextSpan(
      text: item,
      style: TextStyle(
        color: Colors.green,
        fontSize: 30,
      ),
    );
  }
}
