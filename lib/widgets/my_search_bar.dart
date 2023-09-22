import 'package:easy_localization/easy_localization.dart';

import '../utils/utils.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String) onSearch;
  final FocusNode focusNode;

  const MySearchBar({
    super.key,
    required this.onSearch,
    required this.focusNode,
    required this.textEditingController,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      if (widget.textEditingController.text.isNotEmpty && !_showClearButton) {
        setState(() {
          _showClearButton = true;
        });
        return;
      }

      if (widget.textEditingController.text.isEmpty && _showClearButton) {
        setState(() {
          _showClearButton = false;
        });
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onTapOutside: (_) => widget.focusNode.unfocus(),
            focusNode: widget.focusNode,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              hintText: 'search_view_hint_text'.tr(),
              suffixIcon: _showClearButton
                  ? IconButton(
                      onPressed: () => widget.textEditingController.clear(),
                      icon: const Icon(Icons.cancel),
                    )
                  : null,
            ),
            onSubmitted: (_) {
              if (widget.textEditingController.text.trim().length < 2) {
                showSnackBar(
                    context, 'Please enter at least two characters to search.');
                return;
              }

              String searchText = widget.textEditingController.text
                  .replaceAll(RegExp(r'\s+'), ' ');

              widget.onSearch(searchText);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }
}
