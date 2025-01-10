import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool showDivider; // Add this parameter

  const CustomTextFormField({
    required this.hintText,
    this.showDivider = true, // Default to true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.lineGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Tajawal',
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.customBlack,
            fontSize: 14,
            fontFamily: 'Tajawal',
          ),
        ),
        if (showDivider) // Conditionally show the divider
          const Divider(
            color: AppColors.lineGrey,
            thickness: 1,
          ),
      ],
    );
  }
}