import 'package:akhbarak_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AkhbarakApp());
}

class AkhbarakApp extends StatelessWidget {
  const AkhbarakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Akhbarak',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
