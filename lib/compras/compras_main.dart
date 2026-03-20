import 'package:examen_movil/compras/pages/compras_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ComprasApp());
}

class ComprasApp extends StatelessWidget {
  const ComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
        useMaterial3: true,
      ),
      home: const ComprasPages(),
    );
  }
}