import 'package:flutter/material.dart';

enum ItemPriority { normal, high, low, disabled }

const kWheelPickerItem = TextStyle(fontSize: 13.0, color: Color(0xff5f6369));

TextStyle kGetDefaultTitleStyle(BuildContext context, ItemPriority priority) {
  switch (priority) {
    case ItemPriority.high:
      return const TextStyle(fontSize: 15.0, color: Color(0xffd95b58));
    case ItemPriority.low:
      return const TextStyle(fontSize: 15.0, color: Color(0xff3e7e0b));
    case ItemPriority.disabled:
      return const TextStyle(fontSize: 15.0, color: Color(0xff9a9fa7));
    default:
      return Theme.of(context).textTheme.subtitle1.copyWith(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          );
    // TextStyle(fontSize: 14.0, color: Color(0xff5f6369));
  }
}

TextStyle kGetDefaultSubTitleStyle(
    BuildContext context, ItemPriority priority) {
  switch (priority) {
    case ItemPriority.high:
      return const TextStyle(fontSize: 12.0, color: Color(0xffd95b58));
    case ItemPriority.low:
      return const TextStyle(fontSize: 12.0, color: Color(0xff3e7e0b));
    case ItemPriority.disabled:
      return const TextStyle(fontSize: 12.0, color: Color(0xffbdbdbd));
    default:
      // return const TextStyle(fontSize: 12.0, color: Color(0xff757575));
      return Theme.of(context).textTheme.subtitle2.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          );
  }
}

Color kGetSeparatorColor(BuildContext context) {
  return Theme.of(context).dividerColor;
}

TextStyle kGetDefaultSectionTitleStyle(BuildContext context) {
  return TextStyle(fontSize: 13, color: Theme.of(context).accentColor);
}
