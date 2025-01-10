import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 248, 248, 248), // Change drawer icon color here
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
