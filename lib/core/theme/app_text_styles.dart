import 'package:flutter/material.dart';
import 'package:ezycourse_community/core/theme/app_colors.dart';

abstract class AppTextStyles {
  // Headings
  static const TextStyle heading = TextStyle(
    color: AppColors.textWhite,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle subheading = TextStyle(
    color: AppColors.textWhite,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  // Body
  static const TextStyle body = TextStyle(
    color: AppColors.textWhite,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Input
  static const TextStyle input = TextStyle(
    color: AppColors.textWhite,
    fontSize: 15,
  );

  static const TextStyle inputHint = TextStyle(
    color: AppColors.inputHint,
    fontSize: 15,
  );

  static const TextStyle inputError = TextStyle(
    color: AppColors.error,
    fontSize: 12,
  );

  // Button
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: AppColors.textOnAccent,
    fontWeight: FontWeight.bold,
  );

  // Label
  static const TextStyle label = TextStyle(
    color: AppColors.textWhite,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
