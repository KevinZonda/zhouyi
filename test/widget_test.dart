// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zhouyi/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ZhouyiApp());

    // Verify that the app title is displayed.
    expect(find.text('周易'), findsOneWidget);
    expect(find.text('周易占卜系统'), findsOneWidget);
  });
}
