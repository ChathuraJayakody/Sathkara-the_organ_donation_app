import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/map_page.dart';
import 'package:organ_donation_app/Services/saveOrganDonarDetails.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart';
import 'package:provider/provider.dart';

class Findorganpage extends StatefulWidget {
  const Findorganpage({super.key});

  @override
  State<Findorganpage> createState() => _FindorganpageState();
}

class _FindorganpageState extends State<Findorganpage> {

  Stream? organDonarDetailsStream;

  getontheLoad() async {
    organDonarDetailsStream = await Saveorgandonardetails().getOrganDonarDetails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheLoad();
  }

  Widget allOrganDonars() {
    final themProvider = Provider.of<Themeprovider>(context);
    final isDarkMode = themProvider.isDarkMode;

    double mqWidth = MediaQuery.of(context).size.width;
    double mqHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(builder: (context, AsyncSnapshot snapshot) {
      return snapshot.hasData
          ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              DocumentSnapshot ds = snapshot.data.docs[index];
              return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: mqWidth * 0.05,
                          vertical: mqHeight * 0.013),
                      child: Container(
                        height: mqHeight * 0.13,
                        decoration: BoxDecoration(
                          border: Border.all(color: isDarkMode ? Colors.white : Colors.black),
                          color: isDarkMode ?  Colors.black54 : Color.fromARGB(187, 190, 227, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the map page and pass latitude, longitude, and hospital name
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapPage(
                                  latitude: ds['hospital'] == "Kandy Hospital"? 7.28652 : ds['hospital'] == "Colombo Hospital"? 6.919144 : ds['hospital'] == "Galle Hospital"? 6.066531 : ds['hospital'] == "Jaffna Hospital"? 9.665972 : ds['hospital'] == "Matara Hospital"? 5.9477 : 0,
                                  longitude: ds['hospital'] == "Kandy Hospital"? 80.63142 : ds['hospital'] == "Colombo Hospital"? 79.868027 : ds['hospital'] == "Galle Hospital"? 80.225569 : ds['hospital'] == "Jaffna Hospital"? 80.014722 : ds['hospital'] == "Matara Hospital"? 80.5496 : 0,
                                  hospitalName: ds['hospital'],
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Organ Type: '+ ds['organType'],
                                  style: TextStyle(
                                    fontSize: mqHeight * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  )),
                              Text('Hospital: '+ ds['hospital'],
                                  style: TextStyle(
                                    fontSize: mqHeight * 0.025,
                                    color: isDarkMode ? Colors.white70 : Colors.black,
                                  )),
                              Text(
                                  "Contact Number: " + ds['hospital'] == "Kandy Hospital"? "0811234567" : ds['hospital'] == "Colombo Hospital"? "0112233445" : ds['hospital'] == "Galle Hospital"? "0913344556" : ds['hospital'] == "Jaffna Hospital"? "0214455667" : ds['hospital'] == "Matara Hospital"? "0415566778" : "No contact number available",
                                  style: TextStyle(
                                    fontSize: mqHeight * 0.025,
                                    color: isDarkMode ? Colors.white70 : Colors.black,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
            })
          : Container();
    }, stream: organDonarDetailsStream
    );
  }


  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<Themeprovider>(context);
    final isDarkMode = themProvider.isDarkMode;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 136, 147),
      body: Container(
        decoration: isDarkMode
            ? const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Images/image.png'),
                    fit: BoxFit.cover))
            : const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Images/background_image.jpg'),
                    fit: BoxFit.cover),
              ),
        child: Column(
          children: [
            
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Expanded(child: allOrganDonars()),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
