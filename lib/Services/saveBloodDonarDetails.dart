import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organ_donation_app/Models/bloodDonarDetails.dart';

class Saveblooddonardetails {

  // Create a new document reference
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Blood Donar Details');

  Future<void> addBloodDonarDetails(String name, String idNum, String address, String phoneNum, DateTime dateOfBirth, String gender, String medicalCondition, String bloodType, String previousSurgeries, DateTime lastDonatedDate, String anyDiseases) async {
    

    try{

      // Create a new document reference
      final donarDetails = Blooddonardetails(
        id: "",
        name: name,
        idNum: idNum,
        address: address,
        phoneNum: phoneNum,
        dateOfBirth: dateOfBirth,
        gender: gender,
        medicalCondition: medicalCondition,
        bloodType: bloodType,
        previousSurgeries: previousSurgeries,
        lastDonatedDate: lastDonatedDate,
        anyDiseases: anyDiseases
      );


      // convert the donarDetails object to a map
      final Map<String, dynamic> donarData = donarDetails.toJson();

      // add the donarDetails document to Firestore
      await _collectionReference.add(donarData);

    }catch(e){
      Fluttertoast.showToast(msg: "Error $e");
    }
  }
}