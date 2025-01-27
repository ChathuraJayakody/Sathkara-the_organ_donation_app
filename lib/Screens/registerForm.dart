import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:organ_donation_app/Services/saveOrganDonarDetails.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _medicalConditionController.dispose();
    _previousSurgeriesController.dispose();
    _reasonController.dispose();
    _idNumberController.dispose();

  }

  String _selectedBloodType = 'Select Blood Type';
  String _selectedOrganType = 'Select Organ Type';
  DateTime _selectedDate = DateTime.now();
  
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _medicalConditionController = TextEditingController();
  final TextEditingController _previousSurgeriesController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  
  final TextEditingController _dateController = TextEditingController();
  

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(1950), lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

        _dateController.text = DateFormat.yMd().format(_selectedDate);
      });
    }
  }



  final List<String> _organTypes = [
    'Select Organ Type',
    'Kidney',
    'Liver',
    'Heart',
    'Lung',
    'Pancreas',
    'Intestine',
    'Cornea',
    'Skin',
    'Bone Marrow',
  ];

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

  

  @override
  Widget build(BuildContext context) {


    
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(179,205,224,1),
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background_image.jpg'),
            fit: BoxFit.cover,)
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70,right: 30,left: 30),
              child: Column(
                children: [
                  const Text("Enter Donar Details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                         TextFormField(
                          controller: _fullNameController,
                          onChanged: (value) {
                            setState(() {
                              if(value.isNotEmpty){
                                _formkey.currentState!.validate();
                              }
                          });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                          decoration:const InputDecoration(
                            label: Text("Full Name Of Donar"),
                            border: OutlineInputBorder()
                          ),
                        ),
                    
                        const SizedBox(
                      height: 10,
                    ),
                     TextFormField(
                      controller: _idNumberController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                            _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter id number';
                        }
                        return null;
                      },
                      decoration:const InputDecoration(
                        label: Text("ID Number"),
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     TextFormField(
                      controller: _addressController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                          _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter address';
                        }
                        return null;
                      },
                      decoration:const InputDecoration(
                        label: Text("Donar Address"),
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     TextFormField(
                      controller: _phoneController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                          _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter contact number';
                        }
                        return null;
                      },
                      decoration:const InputDecoration(
                        label: Text("Contact Number"),
                        border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _dateController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                          _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date of birth';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("Date Of Birth"),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed: (){
                          _selectDate(context);
                        }, icon: const Icon(Icons.calendar_month_outlined)),
                            
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Medical History Of Donar"),
                    const SizedBox(
                      height: 10,
                    ),
                     TextFormField(
                      controller: _medicalConditionController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                            _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter medical conditions';
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
                      controller: _previousSurgeriesController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                          _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if ( value == null || value.isEmpty) {
                        return 'Please enter any previous surgeries';
                      }
                        return null;},
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
                    DropdownButton(
                      value: _selectedOrganType,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOrganType = newValue as String;
                        });
                      },
                      items: _organTypes.map((organType) {
                        return DropdownMenuItem(
                          value: organType,
                          child: Text(organType),
                        );
                      }).toList(),
                    ),
                    
                    const SizedBox(
                      height: 10,
                    ),
                     TextFormField(
                      controller: _reasonController,
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty){
                          _formkey.currentState!.validate();
                          }
                        });
                      },
                      validator: (value) {
                        if ( value == null || value.isEmpty) {
                          return 'Please enter reason for donate';
                        }
                        return null;
                      },
                      decoration:const InputDecoration(
                        label: Text("Reason For Donate"),
                        border: OutlineInputBorder(),
                        helperStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(onPressed: () async{
                          if(_formkey.currentState!.validate() && _selectedBloodType != 'Select Blood Type' && _selectedOrganType != 'Select Organ Type'){
                            
                            await Saveorgandonardetails().addOrganDonarDetails(
                              _fullNameController.text,
                              _idNumberController.text,
                              _addressController.text,
                              _phoneController.text,
                              _selectedDate,
                              _medicalConditionController.text,
                              _selectedBloodType,
                              _previousSurgeriesController.text,
                              _selectedOrganType,
                              _reasonController.text
                            );
                              
                            _fullNameController.clear();
                            _idNumberController.clear();
                            _addressController.clear();
                            _phoneController.clear();
                            _medicalConditionController.clear();
                            _previousSurgeriesController.clear();
                            _reasonController.clear();
                            _selectedDate = DateTime.now();
                            _selectedBloodType = 'Select Blood Type';
                            _selectedOrganType = 'Select Organ Type';
                              
                            
                            openDialog(context);
                          }
                              
                          if(_selectedBloodType == 'Select Blood Type' || _selectedOrganType == 'Select Organ Type'){
                            Fluttertoast.showToast(
                              msg: "Please Select Blood Type And Organ Type",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                            );
                          }
                            
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(1,31,75,1))
                        ), child: const Text("SUBMIT",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                      ],
                    ),
                  ),
                  
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
  builder: (context)=>  AlertDialog(
    title: const Center(child: Text("Terms and Conditions",
    style: TextStyle(
      fontSize: 20
    ),
    )),
    content: Padding(
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            const Text("Donors must:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("1. Be at least 18 years old.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("2. Be in good physical and mental health.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("3. Not have any medical conditions that would make donation unsafe for the Donor or the recipient.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("4. Not have any infectious diseases that could be transmitted through organ donation.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("5. Not be pregnant or breastfeeding.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("6. Not have a history of substance abuse or addiction.",textAlign: TextAlign.start),
             const SizedBox(
              height: 10,
            ),
            const Text("8. Understand the risks and benefits of organ donation.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("9. Understand the surgical procedure involved in organ donation.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
             const SizedBox(
              height: 10,
            ),
            const Text("10. Understand the potential consequences of organ donation, including the risk of complications or death.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("11. Be aware of the alternatives to organ donation.",textAlign: TextAlign.start),
            const SizedBox(
              height: 10,
            ),
            const Text("12. Make a voluntary decision to donate an organ without coercion or undue influence.",textAlign: TextAlign.start),
            
            const SizedBox(
              height: 30,
            ),
            
            ElevatedButton(onPressed: () {
            
                  
                  Navigator.of(context).pop();
                  
            },
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(1,31,75,1))), child: const Text("I Agree",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    ),
  ),
  );


}

