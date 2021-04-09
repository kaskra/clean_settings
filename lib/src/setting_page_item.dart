import 'package:clean_settings/clean_settings.dart';
import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingPageItem extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? displayValue;
  final TextStyle? displayValueStyle;
  final GestureTapCallback onTap;
  final ItemPriority priority;

  const SettingPageItem({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleStyle,
    this.displayValue,
    this.displayValueStyle,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listTile = ListTile(
      dense: true,
      visualDensity: VisualDensity.comfortable,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      title: Text(title,
          style: titleStyle ?? kGetDefaultTitleStyle(context, priority)),
      trailing: const Icon(Icons.chevron_right),
      subtitle: displayValue != null
          ? Text(displayValue!,
              style: displayValueStyle ??
                  kGetDefaultSubTitleStyle(context, priority))
          : null,
    );
    return priority == ItemPriority.disabled
        ? listTile
        : InkWell(onTap: onTap, child: listTile);
  }
}
