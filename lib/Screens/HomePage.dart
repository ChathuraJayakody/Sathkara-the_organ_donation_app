import 'dart:async';

import 'package:flutter/material.dart';
import 'package:organ_donation_app/Drawer/drawer.dart';
import 'package:organ_donation_app/Screens/donateScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController(viewportFraction: 0.8);
  int activePage = 3;
  Timer? _timer;
  
 
  List<dynamic> images = [
    'assets/Images/image1.jpg',
    'assets/Images/image2.jpg',
    'assets/Images/image3.jpg',
    'assets/Images/image4.jpg',
    'assets/Images/image5.jpg'

  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer){
      if (_pageController.page?.round() == images.length - 1){
        _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
    return Scaffold(
      drawer:const MyDrawer(),
      backgroundColor:const Color.fromRGBO(179,205,224,1),
      appBar: AppBar(
        elevation: 1,
        backgroundColor:const Color.fromRGBO(1,31,75, 1),
        title:const Text("Helth Care",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
        centerTitle: true,
      ),

      body: Column(
        children: [
        Expanded(
          child: PageView.builder(
          itemCount: images.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (page){
            setState(() {
              activePage = page;
            });
          },  
          itemBuilder: 
          (context, pagePosition) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 3)
                      ),
                      margin:const EdgeInsets.all(10),
                      child: Image.asset(images[pagePosition],fit: BoxFit.cover,height: 200,),
                      
                    ),
                  ],
                ),
              );
            },
          
          ),
        ),
         const Padding(
          padding: EdgeInsets.only(left: 30,right: 30),
          child: Text("We're here to bridge the gap between those in need and compassionate donors. Health Care app is designed to streamline the organ donation process, connecting hospitals directly with available donors swiftly and efficiently. Save precious time and lives with our easy-to-use platform. Let's work together to build a healthier Sri Lanka.",style: TextStyle(fontSize: 16,)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset("assets/Images/logo.png",width: 120,),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const DonateScreen()));
            },
            style:const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(1,31,75,1))), child: Text("Donate",style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(onPressed: (){
              
            },
            style:const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(1,31,75,1))), child: Text("Find Organ",style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          ),
        )
        ] 
      ),

      
    );
  }
}