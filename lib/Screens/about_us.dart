import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 31, 75, 1),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(34, 28, 90, 1),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Text(
                //   "About Sathkara",
                //   style: TextStyle(
                //     fontSize: 26,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromRGBO(1, 31, 75, 1),
                //   ),
                // ),
                const SizedBox(height: 30),
                const Text(
                  "Welcome to Sathkara, Sri Lanka's healthcare app for organ and blood donation, dedicated to connecting generous donors with hospitals and individuals in urgent need. Our mission is to foster a culture of compassion, unity, and generosity while making the donation process more accessible, efficient, and reliable. Together, we aim to build a healthier, more empathetic Sri Lanka where every life matters and every act of kindness makes a lasting impact. Join us in bringing hope, healing, and positive change to countless lives across the nation.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(221, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Image.asset(
                  'assets/Images/logo1.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Reach Us On",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.yellow),
                        SizedBox(width: 10),
                        Text(
                          "+94 123 456 789",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(221, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.yellow),
                        SizedBox(width: 10),
                        Text(
                          "support@sathkara.lk",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(221, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     Icon(Icons.location_on, color: Colors.yellow),
                    //     SizedBox(width: 10),
                    //     Expanded(
                    //       child: Text(
                    //         "123, Main Street, Colombo, Sri Lanka",
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: Color.fromARGB(221, 255, 255, 255),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     Icon(Icons.access_time, color: Colors.yellow),
                    //     SizedBox(width: 10),
                    //     Text(
                    //       "Office Hours: 9:00 AM - 6:00 PM",
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Color.fromARGB(221, 255, 255, 255),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
