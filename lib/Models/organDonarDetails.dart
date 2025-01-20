class OrganDonarDetails {

  String id;
  String name;
  String idNum;
  String address;
  String phoneNum;
  DateTime birthDate;
  String medicalCondition;
  String bloodType;
  String previousSurgeries;
  String organType;
  String reason;

  OrganDonarDetails({
    required this.id,
    required this.name,
    required this.idNum,
    required this.address,
    required this.phoneNum,
    required this.birthDate,
    required this.medicalCondition,
    required this.bloodType,
    required this.previousSurgeries,
    required this.organType,
    required this.reason
  });

  // Method to convert the firebase document in to a dart object
  factory OrganDonarDetails.fromJson(Map<String, dynamic> doc, String id){
    return OrganDonarDetails(
      id: id,
      name: doc['name'],
      idNum: doc['idNum'],
      address:  doc['address'],
      phoneNum: doc['phoneNum'],
      birthDate: doc['birthDate'].toDate(),
      medicalCondition: doc['medicalCondition'],
      bloodType: doc['bloodType'],
      previousSurgeries: doc['previousSurgeries'],
      organType: doc['organType'],
      reason: doc['reason'],
    );
  }


  // convert the dart object in to a firebase document
  Map<String, dynamic> toJson() => {
    'name': name,
    'idNum': idNum,
    'address': address,
    'phoneNum': phoneNum,
    'birthDate': birthDate,
    'medicalCondition': medicalCondition,
    'bloodType': bloodType,
    'previousSurgeries': previousSurgeries,
    'organType': organType,
    'reason': reason,
  };
}