import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/app_theme.dart';

const kMaxContentWidth = 800.0;

void main() {
  runApp(const BeadsMarketApp());
}

class BeadsMarketApp extends StatefulWidget {
  const BeadsMarketApp({super.key});

  @override
  State<BeadsMarketApp> createState() => _BeadsMarketAppState();
}

class _BeadsMarketAppState extends State<BeadsMarketApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeadsMarket',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
          child: child!,
        ),
      ),
      themeMode: _themeMode,
      theme: ThemeData(
        fontFamily: 'Helvetica',
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryLight,
          onPrimary: AppColors.onPrimaryLight,
          secondary: AppColors.secondaryLight,
          onSecondary: AppColors.onSecondaryLight,
          surface: AppColors.surfaceLight,
          onSurface: AppColors.onSurfaceLight,
        ),
        scaffoldBackgroundColor: AppColors.surfaceLight,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.onPrimaryLight,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.onPrimaryLight,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColors.surfaceLight,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.primaryLight, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryLight,
            foregroundColor: AppColors.onPrimaryLight,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primaryLight, width: 2),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            color: AppColors.onSurfaceLight,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: AppColors.onSurfaceLight,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            color: AppColors.onSurfaceLight,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            color: AppColors.onSurfaceLight,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            color: AppColors.onSurfaceLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.onSurfaceLight,
          size: AppIconSizes.icon,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.primaryLight,
          contentTextStyle: TextStyle(
            color: AppColors.onPrimaryLight,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Helvetica',
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryDark,
          onPrimary: AppColors.onPrimaryDark,
          secondary: AppColors.secondaryDark,
          onSecondary: AppColors.onSecondaryDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.onSurfaceDark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surfaceDark,
          foregroundColor: AppColors.onSurfaceDark,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.onSurfaceDark,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF2A2A2A),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.primaryDark, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            color: AppColors.onSurfaceDark,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: AppColors.onSurfaceDark,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            color: AppColors.onSurfaceDark,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            color: AppColors.onSurfaceDark,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            color: AppColors.onSurfaceDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.onSurfaceDark,
          size: AppIconSizes.icon,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.primaryDark,
          contentTextStyle: TextStyle(
            color: AppColors.onPrimaryDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeScreen(
        themeMode: _themeMode,
        onThemeChanged: (mode) => setState(() => _themeMode = mode),
      ),
    );
  }
}
