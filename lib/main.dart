import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updated_sneaker_app/models/shop.dart';
import 'package:updated_sneaker_app/themes/light_mode.dart';

import 'screens/intro_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: IntroScreen(),
    );
  }
}
