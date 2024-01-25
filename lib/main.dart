import 'package:alpaka_run/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlpakaRunApp());
}

class AlpakaRunApp extends StatelessWidget {
  const AlpakaRunApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpaka run',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
