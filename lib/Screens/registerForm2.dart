import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


class BloodDonationFormPage extends StatefulWidget {
  const BloodDonationFormPage({super.key});

  @override
  State<BloodDonationFormPage> createState() => _BloodDonationFormPageState();
}

class _BloodDonationFormPageState extends State<BloodDonationFormPage> {
  String _selectedBloodType = 'Select Blood Type';
  String _selectedGender = 'Select Gender';

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dateLastDonated = TextEditingController();
  DateTime? _selectedDate;
  DateTime? _lastDonatedDate;

  final List<String> _bloodTypes = [
    'Select Blood Type',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];


  final List<String> _genderType = [
    'Select Gender',
    'Male',
    'Female',
  ]; 

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(1950), lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        
     _dateController.text = DateFormat.yMd().format(_selectedDate!);
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate:DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime.now());

    if (picked != null && picked != _lastDonatedDate) {
      setState(() {
        
        _lastDonatedDate = picked;

        _dateLastDonated.text = DateFormat.yMd().format(_lastDonatedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(179, 205, 224, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
            child: Form(
              child: Column(
                children: [
                  const Text(
                    "Enter Blood Donor Details",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                        label: Text("Full Name Of Donor"),
                        border: OutlineInputBorder()
                      ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID number';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                        label: Text("ID Number"), border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                        label: Text("Donor Address"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration:const InputDecoration(
                        label: Text("Contact Number"),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.isNotEmpty) {
                              _formKey.currentState!.validate();
                              }
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                          controller: _dateController,
                          decoration: InputDecoration(
                            label: const Text("Date Of Birth"),
                            border: const OutlineInputBorder(),
                            suffixIcon:
                                IconButton(onPressed: () => _selectDate(context),
                                 icon: const Icon(Icons.calendar_month_outlined)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: DropdownButton(
                          value: _selectedGender, 
                          onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue as String;
                        });
                        },
                        items: _genderType.map((genderType){
                        return DropdownMenuItem(
                          value: genderType,
                          child: Text(genderType),
                          );
                      }).toList(), 
                      
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   const Text("Medical History Of Donor"),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your medical history';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                      label: Text("Medical Conditions"),
                      border: OutlineInputBorder(),
                      helperText: 'such as diabetes, hypertension, etc.',
                      helperStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    value: _selectedBloodType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedBloodType = newValue as String;
                      });
                    },
                    items: _bloodTypes.map((bloodType) {
                      return DropdownMenuItem(
                        value: bloodType,
                        child: Text(bloodType),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your previous surgeries';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                      label: Text("Previous Surgeries"),
                      border: OutlineInputBorder(),
                      helperText: 'Any previous surgeries the donor has undergone.',
                      helperStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last donation date';
                      }
                      return null;
                    },
                    controller: _dateLastDonated,
                    decoration: InputDecoration(
                      label: const Text("Last Donation Date"),
                      border: const OutlineInputBorder(),
                      suffixIcon:
                          IconButton(onPressed: () => _selectDate2(context)
                          , icon: const Icon(Icons.calendar_month_outlined)),
                    ),
                  ),
                 
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                        _formKey.currentState!.validate();
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your infectious diseases';
                      }
                      return null;
                    },
                    decoration:const InputDecoration(
                      label: Text("Do you have any infectious diseases"),
                      helperText: 'e.g: Hepatitis, HIV',
                      border: OutlineInputBorder(),
                      helperStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && _selectedBloodType != 'Select Blood Type' || _selectedGender != 'Select Gender') {
                          openDialog(context);
                        }

                        if(_selectedBloodType == 'Select Blood Type' || _selectedGender == 'Select Gender'){
                          Fluttertoast.showToast(
                            msg: "Please select a blood type and gender.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0

                          );}
                        
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color.fromRGBO(1, 31, 75, 1))),
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(child: Text("Terms and Conditions")),
          content: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Blood Donors must:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("1. Be at least 18 years old."),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("2. Be in good physical and mental health."),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "3. Not have any medical conditions that would make donation unsafe for the donor or the recipient."),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "4. Not have any infectious diseases that could be transmitted through blood donation."),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("5. Not be pregnant or breastfeeding."),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("6. Not have a history of substance abuse or addiction."),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("7. Be aware of the risks involved in blood donation."),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "8. Make a voluntary decision to donate blood without coercion or undue influence."),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color.fromRGBO(1, 31, 75, 1))),
                    child: const Text(
                      "I Agree",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
