import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowingoogle/color_schemes.g.dart';
import 'package:nowingoogle/firebase_options.dart';
import 'package:nowingoogle/presentation/injector.dart';
import 'package:nowingoogle/presentation/pages/home_screen.dart';
import 'package:nowingoogle/presentation/pages/event_page.dart';
import 'package:nowingoogle/presentation/layouts/story/story_page.dart';
import 'package:nowingoogle/presentation/pages/profile_screen.dart';
import 'package:nowingoogle/presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => Injector.splashPageBloc),
    BlocProvider(create: (_) => Injector.createProfileBloc),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
          fontFamily: 'Google Sans'),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
        fontFamily: 'Google Sans',
      ),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashPage(),
        'home': (context) => const HomeScreen(),
        'profile': (context) => const ProfileScreen(),
        'event': (context) => const EventPage(),
        'story': (context) => const StoryPage(),
      },
    );
  }
}
