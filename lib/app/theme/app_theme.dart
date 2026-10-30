import 'package:flutter/material.dart';

@immutable
class AppStatusColors extends ThemeExtension<AppStatusColors> {
  const AppStatusColors({
    required this.success,
    required this.warning,
    required this.info,
  });

  final Color success;
  final Color warning;
  final Color info;

  @override
  AppStatusColors copyWith({Color? success, Color? warning, Color? info}) {
    return AppStatusColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppStatusColors lerp(covariant AppStatusColors? other, double t) {
    if (other == null) {
      return this;
    }

    return AppStatusColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF2563EB);
  static const Color primaryDarkColor = Color(0xFF1D4ED8);
  static const Color primaryLightColor = Color(0xFFEFF6FF);
  static const Color backgroundColor = Color(0xFFF9FAFB);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color primaryTextColor = Color(0xFF111827);
  static const Color secondaryTextColor = Color(0xFF374151);
  static const Color mutedTextColor = Color(0xFF6B7280);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color successColor = Color(0xFF22C55E);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color infoColor = Color(0xFF3B82F6);
  static const Color inputBorderColor = Color(0xFFD1D5DB);

  static const double buttonHeight = 48;
  static const double buttonRadius = 12;
  static const double cardRadius = 16;
  static const double spacing16 = 16;

  static ThemeData get lightTheme {
    const colorScheme = ColorScheme.light(
      primary: primaryColor,
      onPrimary: surfaceColor,
      primaryContainer: primaryLightColor,
      onPrimaryContainer: primaryDarkColor,
      secondary: primaryDarkColor,
      onSecondary: surfaceColor,
      tertiary: infoColor,
      onTertiary: surfaceColor,
      error: errorColor,
      onError: surfaceColor,
      surface: surfaceColor,
      onSurface: primaryTextColor,
      onSurfaceVariant: secondaryTextColor,
      outline: inputBorderColor,
    );
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonRadius),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      extensions: const <ThemeExtension<dynamic>>[
        AppStatusColors(
          success: successColor,
          warning: warningColor,
          info: infoColor,
        ),
      ],
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: primaryTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: primaryTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: secondaryTextColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, buttonHeight),
          padding: const EdgeInsets.symmetric(horizontal: spacing16),
          backgroundColor: primaryColor,
          foregroundColor: surfaceColor,
          shape: buttonShape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, buttonHeight),
          padding: const EdgeInsets.symmetric(horizontal: spacing16),
          foregroundColor: primaryDarkColor,
          side: const BorderSide(color: primaryDarkColor),
          shape: buttonShape,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints(minHeight: buttonHeight),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacing16,
          vertical: spacing16,
        ),
        hintStyle: const TextStyle(color: mutedTextColor),
        labelStyle: const TextStyle(color: secondaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(color: inputBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(color: inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(color: primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(color: errorColor),
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 2,
        shadowColor: const Color(0x24000000),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
        ),
      ),
    );
  }
}
