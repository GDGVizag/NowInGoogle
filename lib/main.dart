import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/color_schemes.g.dart';
import 'package:nowingoogle/firebase_options.dart';
import 'package:nowingoogle/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: "Google Sans"),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: "Google Sans"),
      home: const SplashPage(),
    );
  }
}
