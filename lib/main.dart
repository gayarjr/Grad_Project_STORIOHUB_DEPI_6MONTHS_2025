import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const GradProjectStorio());
}

class GradProjectStorio extends StatelessWidget {
  const GradProjectStorio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Innova',
      theme: appTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

