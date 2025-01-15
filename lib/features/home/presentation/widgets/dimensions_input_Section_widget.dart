import 'package:cleancode/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/stateless/custom_text_form_field.dart';
import '../../../../res/assets/assets.dart';

class DimensionsInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "حجم الشحنة",
            style: TextStyle(
              color: AppColors.customBlack,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: CustomTextFormField(
                  hintText: "الطول",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(Assets.x_icon),
              ),
              const Expanded(
                child: CustomTextFormField(
                  hintText: "العرض",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(Assets.x_icon),
              ),
              const Expanded(
                child: CustomTextFormField(
                  hintText: "الارتفاع",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}