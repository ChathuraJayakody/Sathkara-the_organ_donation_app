import 'package:flutter/material.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {

  String _selectedBloodType = 'Select Blood Type';
  String _selectedOrganType = 'Select Organ Type';
  

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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70,right: 30,left: 30),
            child: Column(
              children: [
                const Text("Enter Donar Details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text("Full Name Of Donar"),
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text("ID Number"),
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text("Donar Address"),
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text("Contact Number"),
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    label: const Text("Date Of Birth"),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month_outlined)),
        
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Medical History Of Donar"),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
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
                const TextField(
                  decoration: InputDecoration(
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
                const TextField(
                  decoration: InputDecoration(
                    label: Text("Reason For Donate"),
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
                  child: ElevatedButton(onPressed: (){
                      openDialog(context);
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(1,31,75,1))
                  ), child: const Text("SUBMIT",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
Future openDialog(BuildContext context) => showDialog(
  context: context,
  builder: (context)=>  AlertDialog(
    title: const Center(child: Text("Terms and Conditions")),
    content: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            
            const Text("Donors must:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),),
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
            const Text("3. Not have any medical conditions that would make donation unsafe for the Donor or the recipient."),
            const SizedBox(
              height: 10,
            ),
            const Text("4. Not have any infectious diseases that could be transmitted through organ donation."),
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
            const Text("8. Understand the risks and benefits of organ donation."),
            const SizedBox(
              height: 10,
            ),
            const Text("9. Understand the surgical procedure involved in organ donation."),
            const SizedBox(
              height: 10,
            ),
             const SizedBox(
              height: 10,
            ),
            const Text("10. Understand the potential consequences of organ donation, including the risk of complications or death."),
            const SizedBox(
              height: 10,
            ),
            const Text("11. Be aware of the alternatives to organ donation."),
            const SizedBox(
              height: 10,
            ),
            const Text("12. Make a voluntary decision to donate an organ without coercion or undue influence."),
            
            const SizedBox(
              height: 30,
            ),

            ElevatedButton(onPressed: (){
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

