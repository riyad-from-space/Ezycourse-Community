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

  // Card styles (for light backgrounds)
  static const TextStyle cardTitle = TextStyle(
    color: AppColors.textDark,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle cardSubtitle = TextStyle(
    color: AppColors.textGrey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Screen title (dark text on light bg)
  static const TextStyle screenTitle = TextStyle(
    color: AppColors.textDark,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle screenSubtitle = TextStyle(
    color: AppColors.textGrey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
