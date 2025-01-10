import 'package:cleancode/core/stateless/custom_location_button.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets/assets.dart';

class LocationButtonsSection extends StatelessWidget {
  final String? startCity;
  final String? startState;
  final String? endCity;
  final String? endState;
  final VoidCallback onStartLocationPressed;
  final VoidCallback onEndLocationPressed;

  const LocationButtonsSection({
    required this.startCity,
    required this.startState,
    required this.endCity,
    required this.endState,
    required this.onStartLocationPressed,
    required this.onEndLocationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomLocationButton(
            onPressed: onStartLocationPressed,
            icon: Assets.input_icon,
            text: startCity != null && startState != null
                ? '$startState، $startCity'
                : 'اختر موقع البداية',
            isSelected: startCity != null && startState != null,
          ),
          const SizedBox(height: 12),
          CustomLocationButton(
            onPressed: onEndLocationPressed,
            icon: Assets.location_icon,
            text: endCity != null && endState != null
                ? '$endState، $endCity'
                : 'اختر موقع التوصيل',
            isSelected: endCity != null && endState != null,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}