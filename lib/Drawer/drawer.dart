import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/HomePage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: Colors.white,
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
              "P.Jayakody",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("pjayakody@gmail.com"),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.blueAccent, size: 30),
                  title: const Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  onTap: () {
                    // Navigate to Settings
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.blueAccent, size: 30),
                  title: const Text("About Us", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  onTap: () {
                    // Navigate to About Us
                  },
                ),
                const Divider(height: 20, thickness: 1),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent, size: 30),
                  title: const Text("Log Out", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.redAccent)),
                  onTap: () {
                    // Handle Log Out
                  },
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
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
