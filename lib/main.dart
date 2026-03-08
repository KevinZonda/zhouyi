import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ZhouyiApp());
}

class ZhouyiApp extends StatelessWidget {
  const ZhouyiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '周易天机',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 道教古典色调
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFD4AF37),      // 金色 - 天机神圣
          secondary: const Color(0xFFC9372C),     // 朱砂红 - 吉祥符咒
          surface: const Color(0xFF0D0D0D),       // 深墨色背景
          onPrimary: const Color(0xFF1a1a1a),     // 金色上的深色文字
          onSecondary: Colors.white,              // 朱砂上的白色文字
          onSurface: const Color(0xFFFFF8DC),     // 象牙白文字
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFD4AF37),
            letterSpacing: 4,
          ),
        ),
        // 字体主题
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
            letterSpacing: 8,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFF8DC),
            letterSpacing: 4,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFD4AF37),
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFF8DC),
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFFCCCCCC),
            height: 1.5,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Color(0xFF999999),
          ),
        ),
        // 按钮主题
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC9372C),
            foregroundColor: const Color(0xFFFFF8DC),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
        ),
        // 卡片主题
        cardTheme: CardThemeData(
          color: const Color(0xFF1a1a1a).withValues(alpha: 0.8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color(0x33D4AF37),
              width: 1,
            ),
          ),
        ),
        // 输入框主题
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1a1a1a),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0x33D4AF37)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0x33D4AF37)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD4AF37), width: 2),
          ),
          hintStyle: const TextStyle(color: Color(0xFF666666)),
          contentPadding: const EdgeInsets.all(16),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
