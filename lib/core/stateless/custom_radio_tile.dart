import 'package:cleancode/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String? groupValue;
  final Function(String?) onChanged;
  final String title;

  const CustomRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.simiBlue,
        ),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}