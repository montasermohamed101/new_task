import 'package:cleancode/core/stateless/custom_icon_button.dart';
import 'package:cleancode/core/stateless/custom_text_form_field.dart';
import 'package:cleancode/res/assets/assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

class WeightInputSection extends StatelessWidget {
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;
  final String hintText;

  const WeightInputSection({
    required this.onPlusPressed,
    required this.onMinusPressed,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Assets.plus_icon,
                onPressed: onPlusPressed,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormField(
                    showDivider: false,
                    hintText: hintText,
                  ),
                ),
              ),
              CustomIconButton(
                icon: Assets.minus_icon,
                onPressed: onMinusPressed,
              ),
            ],
          ),
          const Divider(
            color: AppColors.lineGrey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}