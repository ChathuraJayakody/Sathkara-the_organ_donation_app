import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:organ_donation_app/Services/auth.dart';
import 'package:organ_donation_app/users/loginPage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

final AuthServices _auth = AuthServices();

String username = "";
String email = "";
String password = "";
String error = "";

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3,57,108, 1),
      body: SingleChildScrollView(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Images/logo.png",width: 120,),
                const Text("REGISTER",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                             Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Email",style: TextStyle(color: Colors.grey,fontSize: 20),),
                    ),
                    TextFormField(
                    validator: (val) => 
                          val!.isEmpty ? "Enter a valid email" : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: 'Enter Your Email',
                    helperStyle: TextStyle(color: Colors.grey),
                    
                  ),
                  style: const TextStyle(color: Colors.white),
                ), 
                  ],
                ),
        
                const SizedBox(
                  height: 10,
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
                          val!.length < 6 ? "Password must be at least 6 characters" : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: 'Enter New Password',
                    helperStyle: TextStyle(color: Colors.grey),
                    
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                  ],
                ),
                          ],
                        )
                      ),
                       
                    ],
                  ),
                ),
        
                 const SizedBox(
                  height: 10,
                ),
        
                
                
                const SizedBox(
                  height: 20,
                ),
            
                SizedBox(
                  width: 500,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async{
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                      if(result == null){
                        // error
                        setState(() {
                          error = "Please enter a valid email!";
                        });
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Loginpage(),));
                      }
                    },
                    child: const Text("Register",style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
        
                const SizedBox(
                  height: 20,
                ),

                // error text
                Text(error, style: const TextStyle(
                  color: Colors.red
                ),),
        
                RichText(text: TextSpan(children: [
                  const TextSpan(
                    text: "Already have an account ?",
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
        
                  
        
                  TextSpan(
                      text: '  Login here',
                      style: const TextStyle(
                        color: Colors.yellow
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Loginpage()));
                      }
                    )
        
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}