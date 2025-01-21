import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organ_donation_app/Screens/findOrganPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBox = Hive.box('authBox');
    final isLoggedIn = authBox.get('uid') != null; // Check if user is logged in
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
      // home: isLoggedIn ? HomePage() : SplashScreen(),
      // home: Findorganpage(),
      home: const Findorganpage(),
    );
  }
}
