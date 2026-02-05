import 'package:flutter/material.dart';

/// Material UI (MUI) color palette for Hospital App
abstract final class AppColors {
  AppColors._();

  // Primary - Medical/Healthcare feel
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF1565C0);

  // Secondary
  static const Color secondary = Color(0xFF26A69A);
  static const Color secondaryLight = Color(0xFF4DB6AC);
  static const Color secondaryDark = Color(0xFF00897B);

  // Surface & Background
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF1E1E1E);

  // Error, Success, Warning
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);

  // Text
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF212121);
  static const Color onSurfaceDark = Color(0xFFE1E1E1);
  static const Color onError = Color(0xFFFFFFFF);
}
