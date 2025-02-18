import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/HomePage.dart';
import 'package:organ_donation_app/Screens/SettingPage.dart';
import 'package:organ_donation_app/Screens/about_us.dart';
import 'package:organ_donation_app/Services/auth.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  String email;
   MyDrawer({
    super.key,
    required this.email
    });
  

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    return Drawer(
      backgroundColor: isDarkMode ? Colors.black : const Color.fromRGBO(179, 205, 224, 1),
      child: Column(
        children: [
          // Drawer Header with user info and gradient background
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(1, 31, 75, 1),
                  Color.fromRGBO(0, 91, 150, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              "",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail:  Text(email, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  "assets/Images/person.png",
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.blueAccent, size: 30),
                  title: const Text("Home", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  onTap: () {
                    // Navigate to Home
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  HomePage(email: email)));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.blueAccent, size: 30),
                  title: const Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.blueAccent, size: 30),
                  title: const Text("About Us", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  onTap: () {
                    // Navigate to About Us
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutUs()));
                  },
                ),
                const Divider(height: 20, thickness: 1),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent, size: 30),
                  title: const Text("Log Out", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.redAccent)),
                  onTap: () => AuthServices().signOut(context),
                ),
              ],
            ),
          ),
          // Footer
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "App Version: 1.0.0",
                  style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 57, 57, 57)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
