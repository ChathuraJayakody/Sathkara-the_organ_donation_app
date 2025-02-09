import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    final bool isDarkMode = themeProvider.isDarkMode; // ✅ Directly use provider state

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : const Color.fromRGBO(1, 31, 75, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          }, 
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white), // ✅ Ensure text is visible on AppBar
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Appearance",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(); // ✅ Toggle dark mode
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
