import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure a Directionality widget is provided to avoid assertion errors.
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFFFB375E),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.3,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
