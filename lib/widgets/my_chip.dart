import 'my_dialog.dart';
import 'package:flutter/material.dart';

class MyChip extends StatefulWidget {
  final String label;
  final String keyString;
  final Map<String, String> dialogItemMap;
  final String dialogLabel;
  final void Function(String) onConfirmed;
  final void Function() onDeleted;

  const MyChip({
    super.key,
    required this.label,
    required this.keyString,
    required this.dialogLabel,
    required this.onConfirmed,
    required this.dialogItemMap,
    required this.onDeleted,
  });

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return InputChip(
      showCheckmark: false,
      onDeleted: widget.keyString == '' ? null : () => widget.onDeleted(),
      selected: widget.keyString == '' ? false : true,
      label: Text(
        widget.keyString == ''
            ? widget.label
            : widget.dialogItemMap[widget.keyString]!,
      ),
      onSelected: (isSelected) async {
        String? selectedType = await showDialog(
          context: context,
          builder: (context) {
            return MyDialog(
              title: widget.dialogLabel,
              options: widget.dialogItemMap,
            );
          },
        );

        if (selectedType != null) {
          widget.onConfirmed(selectedType);
        }
      },
    );
  }
}
