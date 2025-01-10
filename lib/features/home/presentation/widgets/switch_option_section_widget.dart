import 'package:cleancode/res/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/colors/app_colors.dart';

class SwitchOptionsSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSwitchSelected;

  const SwitchOptionsSection({
    required this.selectedIndex,
    required this.onSwitchSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8FE),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFCFD7E2),
              offset: Offset(-2, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(2, -2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSwitchOption(
              icon: Assets.car_icon,
              text: 'شحن محلي',
              index: 0,
              isSelected: selectedIndex == 0,
              onTap: () => onSwitchSelected(0),
            ),
            _buildSwitchOption(
              icon: Assets.plan_icon,
              text: 'شحن دولي',
              index: 1,
              isSelected: selectedIndex == 1,
              onTap: () => onSwitchSelected(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchOption({
    required String icon,
    required String text,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
            const BoxShadow(
              color: Color(0xFFCFD7E2),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0, -4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ]
              : [],
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.purple : const Color(0xffCFD7E2),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              icon,
              color: isSelected ? AppColors.purple : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}