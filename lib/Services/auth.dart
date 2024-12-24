import 'package:firebase_auth/firebase_auth.dart';
import 'package:organ_donation_app/Models/UserModel.dart';

class AuthServices{

  //firebase instatnce
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user from firebase user with uid
  UserModel? _userWithFirebaseUserUid(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //create the stream for checking the auth changes in the user
  Stream <UserModel?> get user{
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }
  
  //Sign in anonymous
  Future signInAnonymously () async{

    try{
      UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return _userWithFirebaseUserUid(user);
    } catch (err){
      print(err.toString());
      return null;
    }
    

  }

  //register using email and password
  Future registerWithEmailAndPassword (String email, dynamic password) async{
    try{

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      return _userWithFirebaseUserUid(user);

    }catch(err){
      print(err.toString());
      return null;
    }
  }

  //sign in using gmail
  Future signInUsingEmailAndPassword(String email,String password) async{
    try{

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      return _userWithFirebaseUserUid(user);

    }catch(err){
      print(err.toString());
      return null;
    }
  }

  //signout


}