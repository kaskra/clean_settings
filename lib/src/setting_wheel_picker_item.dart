import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'setting_item.dart';
import 'setting_styles.dart';

class SettingWheelPickerItem<T> extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? displayValue;
  final TextStyle? displayValueStyle;
  final String? hintText;
  final String? pickerSuffix;
  final List<T> items;
  final int initialValueIndex;

  final ValueChanged<int> onChanged;
  final ItemPriority priority;

  const SettingWheelPickerItem({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.displayValue,
    required this.items,
    this.titleStyle,
    this.displayValueStyle,
    this.initialValueIndex = 0,
    this.hintText,
    this.pickerSuffix,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      priority: priority,
      title: title,
      titleStyle: titleStyle,
      displayValue: displayValue,
      displayValueStyle: displayValueStyle,
      onTap: () async {
        var changedValueIndex = await showDialog(
          context: context,
          builder: (_) {
            var selectedValueIndex = initialValueIndex;
            final pickerWidget = Expanded(
              child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: initialValueIndex),
                itemExtent: 50.0,
                onSelectedItemChanged: (int value) {
                  selectedValueIndex = value;
                },
                children: items
                    .map(
                      (e) => Center(
                          child: Text(
                        e.toString(),
                        style: kWheelPickerItem,
                      )),
                    )
                    .toList(),
              ),
            );
            return AlertDialog(
              title: Text(title),
              content: Container(
                constraints: BoxConstraints(maxHeight: 100.0),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pickerSuffix == null
                        ? [pickerWidget]
                        : [
                            SizedBox(width: 100.0, child: pickerWidget),
                            Text(pickerSuffix!)
                          ]),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context, selectedValueIndex),
                )
              ],
            );
          },
        );
        if (changedValueIndex != null &&
            changedValueIndex != initialValueIndex) {
          onChanged(changedValueIndex);
        }
      },
    );
  }
}
