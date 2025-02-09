import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:organ_donation_app/Screens/registerForm.dart';
import 'package:organ_donation_app/Screens/registerForm2.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart';
import 'package:provider/provider.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final themeData = Themeprovider().themeData;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    final bool isDarkMode = themeProvider.isDarkMode;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(179, 205, 224, 1),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        elevation: 1,
        backgroundColor: isDarkMode ? Colors.black : const Color.fromRGBO(1, 31, 75, 1),
        title: const Text(
          "Sathkara",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: isDarkMode
              ? const DecorationImage(
                  image: AssetImage('assets/Images/image.png'),
                  fit: BoxFit.cover,
                )
              : const DecorationImage(
                  image: AssetImage('assets/Images/background_image.jpg'),
                  fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/Images/logo.png",
                width: 100,
              ),
              const Text(
                "Organ Donation",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Giving a second change of life is in your hands.",
                style: isDarkMode
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterFormPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 15),
                  child: Container(
                    width: 180,
                    height: 170,
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Lottie.asset(
                                'assets/Images/Animation - 1736575011484.json')),
                        // Positioned text at the bottom center
                        const Positioned(
                          bottom: 2, // Distance from the bottom
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              "ORGANS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor:
                                    Color.fromARGB(0, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodDonationFormPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Container(
                    width: 180,
                    height: 170,
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child:
                                Lottie.asset('assets/Images/Animation2.json')),
                        // Positioned text at the bottom center
                        const Positioned(
                          bottom: 10, // Distance from the bottom
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              "BLOOD",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor:
                                    Color.fromARGB(0, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
