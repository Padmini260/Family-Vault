import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FamilyVaultApp());
}

class FamilyVaultApp extends StatelessWidget {
  const FamilyVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FamilyVault',
      home: const SplashScreen(),
    );
  }
}