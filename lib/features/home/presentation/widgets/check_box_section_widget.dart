
import 'package:flutter/material.dart';



class CheckboxSection extends StatefulWidget {
  final String label;
  final List<String> items;
  final List<IconData> icons;
  const CheckboxSection({
    required this.label,
    required this.items,
    required this.icons,
  });

  @override
  _CheckboxSectionState createState() => _CheckboxSectionState();
}

class _CheckboxSectionState extends State<CheckboxSection> {
  bool _isChecked = false;
  Map<String, bool> _itemStates = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      _itemStates[item] = false;
    }
  }

  void _printCheckedItems() {
    List<String> checkedItems = [];
    _itemStates.forEach((item, isChecked) {
      if (isChecked) {
        checkedItems.add(item);
      }
    });

    print("Checked Items: $checkedItems");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              activeColor: Colors.green,
            ),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),

        if (_isChecked)
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final icon = widget.icons[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          size: 24,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item,
                          style: const TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: _itemStates[item] ?? false,
                      onChanged: (value) {
                        setState(() {
                          _itemStates[item] = value ?? false;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),

      ],
    );
  }
}



