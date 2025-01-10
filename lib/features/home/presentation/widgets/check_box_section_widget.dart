import 'package:cleancode/core/colors/app_colors.dart';
import 'package:cleancode/core/stateless/custom_check_box.dart';
import 'package:flutter/material.dart';

class CheckboxSection extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String label;

  const CheckboxSection({
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.purple,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}