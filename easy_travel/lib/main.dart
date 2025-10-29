import 'package:easy_travel/features/auth/register_page.dart';
import 'package:easy_travel/core/ui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(TextTheme());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      highContrastTheme: theme.lightHighContrast(),
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: Scaffold(body: SafeArea(child: RegisterPage())),
    );
  }
}
