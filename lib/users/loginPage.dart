import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:organ_donation_app/Screens/HomePage.dart';
import 'package:organ_donation_app/Services/auth.dart';
import 'package:organ_donation_app/users/registerPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

// ref for the AuthServices class
final AuthServices _auth = AuthServices();

// form key
final _formKey = GlobalKey<FormState>();

// email password states
String email = "";
String password = "";
String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3,57,108, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 100),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/Images/logo.png",width: 120,),
                  const Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Your Email",style: TextStyle(color: Colors.grey,fontSize: 20),),
                      ),
                      TextFormField(
                      validator: (val) => 
                          val?.isEmpty == true ? "Enter a valid email" : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      helperText: 'Enter Your Registered Email',
                      helperStyle: TextStyle(color: Colors.grey),
                      
                    ),
                    style: const TextStyle(color: Colors.white),
                  ), 
                    ],
                  ),
                      
                  const SizedBox(
                    height: 15,
                  ),
                  
              
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Password",style: TextStyle(color: Colors.grey,fontSize: 20),),
                      ),
                      
                      TextFormField(
                        obscureText: true,
                      validator: (val) => 
                          val!.length < 6 ? "Enter a valid password" : null,
                          onChanged: (val){
                            setState(() {
                              password = val;
                            });
                          },
                      decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      helperText: 'Enter Your Password',
                      helperStyle: TextStyle(color: Colors.grey),
                      
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
              
                  SizedBox(
                    width: 500,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async{
                        dynamic result = await _auth.signInUsingEmailAndPassword(email, password);

                        if(result==null){
                          setState(() {
                            error = "Could not signin with incorrect user credintial";
                          });
                        } else{
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),));
                        }
                      },
                      child: const Text("Login",style: TextStyle(fontSize: 20),),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(error, style: const TextStyle(color: Colors.red),),
                      
                  const SizedBox(
                    height: 20,
                  ),
                      
                  RichText(text: TextSpan(children: [
                    const TextSpan(
                      text: "If you haven't an account ?",
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                      
                    
                      
                    TextSpan(
                        text: '  Register here',
                        style: const TextStyle(
                          color: Colors.yellow
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                        }
                      )
                      
                  ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

