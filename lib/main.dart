import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organ_donation_app/Screens/HomePage.dart';
import 'package:organ_donation_app/Screens/SettingPage.dart';
import 'package:organ_donation_app/Screens/splash_screen.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart'; //  Import ThemeProvider
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('authBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Themeprovider()), //  Add ThemeProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBox = Hive.box('authBox');
    final isLoggedIn = authBox.get('uid') != null; // Check if user is logged in

    return Consumer<Themeprovider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeProvider.themeData, //  Apply dynamic theme
          home: isLoggedIn ? const HomePage() : const SplashScreen(),
        );
      },
    );
  }
}
