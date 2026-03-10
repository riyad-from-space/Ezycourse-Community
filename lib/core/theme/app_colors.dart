import 'dart:ui';

abstract class AppColors {
  // Primary palette
  static const Color primary = Color(0xff115C67);
  static const Color primaryDark = Color(0xff023D45);
  static const Color accent = Color(0xffE8F54A);

  // Text
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textWhite70 = Color(0xB3FFFFFF);
  static const Color textOnAccent = Color(0xff115C67);
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textGrey = Color(0xFF6B7280);
  static const Color textGreyLight = Color(0xFF9CA3AF);

  // Input fields
  static const Color inputFill = Color(0xff115C67);
  static const Color inputHint = Color(0xB3FFFFFF);
  static const Color inputIcon = Color(0xB3FFFFFF);

  // Surface / Cards
  static const Color surface = Color(0xFFF8FAFB);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE5E7EB);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  // Feedback
  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF43A047);
}
