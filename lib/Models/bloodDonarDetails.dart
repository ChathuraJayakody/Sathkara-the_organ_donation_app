class Blooddonardetails {
  String? id;
  String? name;
  String? idNum;
  String? address;
  String? phoneNum;
  DateTime? dateOfBirth;
  String? gender;
  String? hospital;
  String? medicalCondition;
  String? bloodType;
  String? previousSurgeries;
  DateTime? lastDonatedDate;
  String? anyDiseases;

  Blooddonardetails({
    required this.id,
    required this.name,
    required this.idNum,
    required this.address,
    required this.phoneNum,
    required this.dateOfBirth,
    required this.gender,
    required this.hospital,
    required this.medicalCondition,
    required this.bloodType,
    required this.previousSurgeries,
    required this.lastDonatedDate,
    required this.anyDiseases
  });

  // convert a map to a donarDetails object
  factory Blooddonardetails.fromJson(Map<String, dynamic> doc, String id){
    return Blooddonardetails(
      id: id,
      name: doc['name'],
      idNum: doc['idNum'],
      address: doc['address'],
      phoneNum: doc['phoneNum'],
      dateOfBirth: doc['dateOfBirth'].toDate(),
      gender: doc['gender'],
      hospital: doc['hospital'],
      medicalCondition: doc['medicalCondition'],
      bloodType: doc['bloodType'],
      previousSurgeries: doc['previousSurgeries'],
      lastDonatedDate: doc['lastDonatedDate'].toDate(),
      anyDiseases: doc['anyDiseases']
    );
  }

  // convert the donarDetails object to a map
  Map<String, dynamic> toJson() => {
    'name': name,
    'idNum': idNum,
    'address': address,
    'phoneNum': phoneNum,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'hospital': hospital,
    'medicalCondition': medicalCondition,
    'bloodType': bloodType,
    'previousSurgeries': previousSurgeries,
    'lastDonatedDate': lastDonatedDate,
    'anyDiseases': anyDiseases
  };
}