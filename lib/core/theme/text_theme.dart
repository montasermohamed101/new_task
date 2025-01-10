import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTextTheme {
  AppTextTheme._(); // Private constructor to prevent instantiation

  static TextStyle get displayLarge => const TextStyle(
    color: AppColors.richBlack,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get titleLarge => const TextStyle(
    color: AppColors.richBlack,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get bodyLarge => const TextStyle(
    color: AppColors.slateGrey,
    fontSize: 16,
  );

  static TextStyle get bodyMedium => const TextStyle(
    color: AppColors.slateGrey,
    fontSize: 14,
  );

  static TextStyle get labelLarge => const TextStyle(
    color: AppColors.elegantWhite,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get bodySmall => const TextStyle(
    color: AppColors.slateGrey,
    fontSize: 12,
  );
}
