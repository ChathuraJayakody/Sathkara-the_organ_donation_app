import 'package:flutter/material.dart';

class Hospitallocations extends StatefulWidget {
  const Hospitallocations({super.key});

  @override
  State<Hospitallocations> createState() => _HospitallocationsState();
}

class _HospitallocationsState extends State<Hospitallocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color.fromRGBO(179,205,224,1),
      appBar: AppBar(
        elevation: 1,
        backgroundColor:const Color.fromRGBO(1,31,75, 1),
        title:const Text("Kandy Hospital",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: 400,
          width: double.infinity,
          alignment: Alignment.center,
          color: const Color.fromARGB(126, 30, 30, 32),
          
        ),
      ),
    );
    
  }
}