import 'package:flutter/material.dart';
import 'package:ticketfirst/Constant/Widgets/eventFilters.dart';

class SearchField extends StatefulWidget {
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
    this.trailingIcon = Icons.filter_list,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _showFilter = false; // State to control filter visibility

  void _toggleFilter() {
    setState(() {
      _showFilter = !_showFilter; // Toggle the filter visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.leadingIcon, color: Colors.grey.shade600),
              suffixIcon: IconButton(
                icon: Icon(widget.trailingIcon, color: Colors.grey.shade600),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventFilterWidget(),
                    ),
                  );
                },
              ),
              hintText: widget.hintText,
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
        ),
        // Display the filter widget when _showFilter is true
        if (_showFilter) EventFilterWidget(),
      ],
    );
  }
}
