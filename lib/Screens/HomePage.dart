import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organ_donation_app/Drawer/drawer.dart';
import 'package:organ_donation_app/Screens/donateScreen.dart';
import 'package:organ_donation_app/Screens/findOrganPage.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int activePage = 3;
  Timer? _timer;

  List<String> images = [
    'assets/Images/image1.jpg',
    'assets/Images/image2.jpg',
    'assets/Images/image3.jpg',
    'assets/Images/image4.jpg',
    'assets/Images/image5.jpg'
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page?.round() == images.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    final bool isDarkMode =
        themeProvider.isDarkMode; 

    double mqHeight = MediaQuery.of(context).size.height;
    double mqWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: isDarkMode
          ? Colors.black
          : const Color.fromRGBO(
              179, 205, 224, 1), 
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer(); 
            },
            icon: Icon(
              size: 30,
              Icons.menu,
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),

        elevation: 1,
        backgroundColor: isDarkMode
            ? Colors.grey[900]
            : const Color.fromRGBO(1, 31, 75, 1), 
        title: Text(
          "Sathkara",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: isDarkMode
                ? Colors.white
                : const Color.fromARGB(
                    255, 255, 255, 255), 
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: isDarkMode
              ? const DecorationImage(
                  image: AssetImage("assets/Images/image.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(153, 56, 56, 56),
                    BlendMode.darken,
                  ),
                )
              : const DecorationImage(
                  image: AssetImage("assets/Images/bg4.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(153, 56, 56, 56),
                    BlendMode.darken,
                  ),
                ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Padding(
                    padding: EdgeInsets.only(top: mqHeight * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(images[pagePosition],
                                fit: BoxFit.cover, height: 170, width: 1000),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: mqWidth * 0.06, right: mqWidth * 0.06),
              child: Text(
                "We're here to bridge the gap between those in need and compassionate donors. Sathkara app is designed to streamline the organ donation process, connecting hospitals directly with available donors swiftly and efficiently. Save precious time and lives with our easy-to-use platform. Let's work together to build a healthier Sri Lanka.",
                style: TextStyle(
                  fontSize: mqWidth * 0.035,
                  color: isDarkMode
                      ? Colors.white
                      : const Color.fromARGB(
                          255, 255, 255, 255), 
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: mqHeight * 0.04),
              child: Image.asset("assets/Images/logo3.png", width: 150),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: mqHeight * 0.03, top: mqHeight * 0.04),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonateScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(isDarkMode
                        ? Colors.grey[800]
                        : const Color.fromRGBO(
                            1, 31, 75, 1)), 
                  ),
                  child: const Text("Donate",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: mqHeight * 0.05),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Findorganpage()));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(isDarkMode
                        ? Colors.grey[800]
                        : const Color.fromRGBO(
                            1, 31, 75, 1)), 
                  ),
                  child: const Text("Find Organ",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
