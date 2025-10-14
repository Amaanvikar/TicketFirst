import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;
  final IconData leadingIcon;
  final IconData trailingIcon;

  const SearchField({
    super.key,
    this.controller,
    this.onClear,
    this.onChanged,
    this.hintText = 'Search...',
    this.leadingIcon = Icons.search,
    this.trailingIcon = Icons.clear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(leadingIcon, color: Colors.grey.shade600),
          suffixIcon: IconButton(
            icon: Icon(trailingIcon, color: Colors.grey.shade600),
            onPressed:
                onClear ??
                () {
                  controller?.clear();
                  onChanged?.call('');
                },
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
        ),
        style: TextStyle(
          color: theme.textTheme.bodyMedium?.color,
          fontSize: 15,
        ),
      ),
    );
  }
}
