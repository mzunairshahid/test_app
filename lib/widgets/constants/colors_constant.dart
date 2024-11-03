import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF0A5FAE),
      onPrimary: Colors.white,
      secondary: Color(0x190A5FAE),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF1F2F4),
      foregroundColor: Color(0xFF0A5FAE),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFF1F2F4),
        elevation: 0,
        selectedItemColor: Color(0xFF0A5FAE),
        unselectedItemColor: Colors.grey),
    drawerTheme: DrawerThemeData(
      backgroundColor: const Color(0xFF0A5FAE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: const BorderSide(color: Color(0xFF0A5FAE), width: 1.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return const Color(0xFF08437A);
            } else if (states.contains(WidgetState.hovered)) {
              return const Color(0xFF0D77D8);
            }
            return const Color(0xFF0A5FAE);
          },
        ),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return const Color(0xFF0D77D8).withOpacity(0.2);
            }
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return const Color(0xFF08437A).withOpacity(0.2);
            }
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (Set<WidgetState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            );
          },
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (Set<WidgetState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            );
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return const Color(0xFF0D77D8).withOpacity(0.2);
            }
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return const Color(0xFF08437A).withOpacity(0.2);
            }
            return Colors.transparent;
          },
        ),
        side: WidgetStateProperty.all(
          const BorderSide(color: Colors.blue, width: 1.5),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
          borderRadius: BorderRadius.zero),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.zero),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
          borderRadius: BorderRadius.zero),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.zero),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.zero),
      labelStyle: const TextStyle(color: Colors.blueGrey),
      hintStyle: const TextStyle(color: Colors.grey),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
      headlineLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      titleMedium: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
      bodySmall: TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.grey),
      labelLarge: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
      labelMedium: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
      labelSmall: TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.black),
    ),
    // showDialog theme
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),

    dividerTheme: const DividerThemeData(
      space: 0.00,
      color: Color(0xFFF1F2F4),
    ),
    // TooltipTheme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: const Color(0xFF0A5FAE), // Tooltip background color
        borderRadius:
            BorderRadius.circular(3), // Rounded corners for the tooltip
      ),
      textStyle: const TextStyle(
        color: Colors.white, // Tooltip text color
        fontSize: 12, // Tooltip font size
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 8), // Padding inside the tooltip
      showDuration:
          const Duration(seconds: 2), // Duration tooltip stays visible
      waitDuration:
          const Duration(milliseconds: 500), // Delay before showing tooltip
      preferBelow: true, // Prefer showing tooltip below the widget
    ),
  );
}
