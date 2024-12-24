import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(179,205,224,1),
      child: ListView(
        children:  [
         const DrawerHeader(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white,width: 10)),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
              color: Color.fromRGBO(1,31,75,1)
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
                color: Color.fromRGBO(1,31,75,1)
              ),
              accountName: Text("User Name",style: TextStyle(fontSize: 16),),
              accountEmail: Text("User Email",style: TextStyle(fontSize: 16)),
              currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/Images/person.png"),
              ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Container(
                color: const Color.fromRGBO(0,91,150,1),
                child: ListTile(
                  leading: const Icon(Icons.settings,color: Colors.white,size: 30,),
                  title: const Text("Settings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  
                  onTap: (){
                
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Container(
                color: const Color.fromRGBO(0,91,150,1),
                child: ListTile(
                  leading: const Icon(Icons.note_alt_rounded,color: Colors.white,size: 30,),
                  title: const Text("About Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  onTap: (){
                
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 5),
              child: Container(
                color: const Color.fromRGBO(0,91,150,1),
                child: ListTile(
                  leading: const Icon(Icons.logout,color: Colors.white,size: 30,),
                  title: const Text("Log Out",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  onTap: (){
                
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}