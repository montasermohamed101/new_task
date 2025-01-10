import 'package:cleancode/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/assets/assets.dart';

class CustomLocationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String text;
  final bool isSelected;

  const CustomLocationButton({
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        side: BorderSide(
          color: isSelected ? Colors.green : AppColors.lineGrey,
          width: 1,
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.lineGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? AppColors.customBlack : AppColors.lineGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                ),
              ),
            ],
          ),
          SvgPicture.asset(Assets.arrow_down)
        ],
      ),
    );
  }
}
