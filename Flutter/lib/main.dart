import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// This is where the app starts.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        // We will add theme management here.
        
      ),

      // Replace the scaffold here with the interface you want it to appear:
      home: const Scaffold()
    );
  }
}
