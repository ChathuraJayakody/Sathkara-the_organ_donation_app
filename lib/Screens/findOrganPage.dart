import 'package:flutter/material.dart';

class Findorganpage extends StatefulWidget {
  const Findorganpage({super.key});

  @override
  State<Findorganpage> createState() => _FindorganpageState();
}

class _FindorganpageState extends State<Findorganpage> {
  List<Map<String, String>> organList = [
    {'organ': 'Heart', 'hospital': 'Kandy Hospital', 'contact': '0771234567'},
    {'organ': 'Eye', 'hospital': 'Colombo Hospital', 'contact': '0112233445'},
    {'organ': 'Kidney', 'hospital': 'Galle Hospital', 'contact': '0913344556'},
    {'organ': 'Liver', 'hospital': 'Jaffna Hospital', 'contact': '0214455667'},
    {'organ': 'Lung', 'hospital': 'Matara Hospital', 'contact': '0415566778'},
  ];
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Scaffold(
      body: Text("chathura piyumal jayakody"),
=======
    double mqWidth = MediaQuery.of(context).size.width;
    double mqHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 136, 147),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Images/background_image.jpg'),
          fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: mqHeight * 0.08,
                left: mqWidth * 0.05,
                right: mqWidth * 0.05,
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: mqWidth * 0.06, top: mqHeight * 0.015, bottom: mqHeight * 0.015),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 190, 227, 233),
                  hintText: "Search...",
                  suffixIcon: Padding(
                    padding:  EdgeInsets.only(right: mqHeight * 0.03),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                      
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(50),
                    ),
                  ),
                  
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: mqHeight * 0.025,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                  itemCount: organList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: mqWidth * 0.05, vertical: mqHeight * 0.013),
                      child: Container(
                        height: mqHeight * 0.13,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          color: Color.fromARGB(255, 153, 198, 212),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Organ Type: ${organList[index]['organ']}',
                                  style: TextStyle(
                                    fontSize: mqHeight * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Text('Hospital: ${organList[index]['hospital']}',
                                  style: TextStyle(
                                    fontSize: mqHeight * 0.025,
                                    color: Colors.black,
                                  )),
                              Text(
                                  "Contact Number: ${organList[index]['contact']}",
                                  style: TextStyle(
                                    fontSize: mqHeight * 0.025,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
>>>>>>> main
    );
  }
}
