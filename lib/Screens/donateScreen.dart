import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/registerForm.dart';
import 'package:organ_donation_app/Screens/registerForm2.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(179,205,224,1),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
            Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        elevation: 1,
        backgroundColor:const Color.fromRGBO(1,31,75, 1),
        title:const Text("Helth Care",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          children: [
            Image.asset("assets/Images/logo.png",width: 100,),
            const Text("Organ Donation",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const Text("Giving a second change of life is in your hands.",style: TextStyle(fontSize: 15,color: Colors.black),),
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterFormPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 15),
                child: Container(
                  width: 200,
                  height: 190,
                  decoration:const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black,width: 3),
                      vertical: BorderSide(color: Colors.black, width: 3)
                      ),
                    image: DecorationImage(image: AssetImage("assets/Images/heart.png"),
                    fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(3,57,108,1)
                  ),
                  child: const Stack(
                   children: [
                  // Positioned text at the bottom center
                  Positioned(
                    bottom: 10, // Distance from the bottom
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "ORGANS",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          backgroundColor: Color.fromARGB(189, 255, 255, 255),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BloodDonationFormPage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Container(
                width: 200,
                height: 190,
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black, width: 3),
                    vertical: BorderSide(color: Colors.black, width: 3),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/Images/blood.jpg"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(3, 57, 108, 1),
              ),
              child:const Stack(
                children: [
                  // Positioned text at the bottom center
                  Positioned(
                    bottom: 10, // Distance from the bottom
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "BLOOD",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          backgroundColor: Color.fromARGB(189, 255, 255, 255),
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
    );
  }
}

