import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organ_donation_app/Models/organDonarDetails.dart';

class Saveorgandonardetails {

  // Reference to the Firestore collection
  final CollectionReference _collectionReference = 
    FirebaseFirestore.instance.collection('Organ_Donar_Details');

  // Function to save user data to Firestore
   Future<void> addOrganDonarDetails(String name, String id, String address, String contact, DateTime birthDate, String medicalCondition, String bloodType, String previousSurgeries, String organType, String reasonForDonation) async {
    
    try{

      // Create a new document reference
      final donarDetails = OrganDonarDetails(
        id: "",
        name: name,
        idNum: id,
        address: address,
        phoneNum: contact,
        birthDate: birthDate,
        medicalCondition: medicalCondition,
        bloodType: bloodType,
        previousSurgeries: previousSurgeries,
        organType: organType,
        reason: reasonForDonation
      );

      // convert the donarDetails object to a map
      final Map<String, dynamic> donarData = donarDetails.toJson();

      // add the donarDetails document to Firestore
      await _collectionReference.add(donarData);


    }catch(e){
      print("Error $e");
    }
   }
}