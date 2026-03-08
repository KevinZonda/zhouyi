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
      title: '??',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Color(0xFFe94560),
          secondary: Color(0xFF0f3460),
          surface: Color(0xFF1a1a2e),
          background: Color(0xFF1a1a2e),
        ),
        scaffoldBackgroundColor: Color(0xFF1a1a2e),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
