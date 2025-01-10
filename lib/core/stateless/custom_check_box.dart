import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(
          color: Color(0xFF77758A),
          width: 1,
        ),
      ),
    );
  }
}