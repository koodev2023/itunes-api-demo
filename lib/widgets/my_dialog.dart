import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  final Map<String, String> options;
  final String title;

  const MyDialog({
    super.key,
    required this.options,
    required this.title,
  });

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      title: Text(widget.title),
      content: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.options.length,
            (index) => ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.options.values.toList()[index],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  selectedOption == widget.options.keys.toList()[index]
                      ? const Icon(Icons.check)
                      : const SizedBox.shrink(),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedOption = widget.options.keys.toList()[index];
                });
              },
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).hintColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () {
            if (selectedOption != null) {
              Navigator.of(context).pop(selectedOption);
            }
          },
        ),
      ],
    );
  }
}
