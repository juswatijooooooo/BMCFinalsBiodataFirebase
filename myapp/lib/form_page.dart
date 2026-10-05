import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dateofbirthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationallityController = TextEditingController();
  final TextEditingController civilstatusController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController mothernameController = TextEditingController();
  final TextEditingController languageknownController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
    ageController.text.trim().isEmpty||
    dateofbirthController.text.trim().isEmpty ||
    genderController.text.trim().isEmpty ||
    nationallityController.text.trim().isEmpty ||
    civilstatusController.text.trim().isEmpty ||
    religionController.text.trim().isEmpty ||
    fathernameController.text.trim().isEmpty ||
    mothernameController.text.trim().isEmpty ||
    languageknownController.text.trim().isEmpty||
    addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please Fill in all fields')),
      );
      return;
    }
    
    await firestore.collection('biodata').add({
      'name': nameController.text.trim(),
      'age': ageController.text.trim(),
      'date_of_birth': dateofbirthController.text.trim(),
      'gender': genderController.text.trim(),
      'nationallity': nationallityController.text.trim(),
      'civil_status': civilstatusController.text.trim(),
      'religion': religionController.text.trim(),
      'father\'s_name': fathernameController.text.trim(),
      'mother\'s_name': mothernameController.text.trim(),
      'language_known': languageknownController.text.trim(),
      'address': addressController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),

  });
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('Data Saved successfully')));

  nameController.clear();
  ageController.clear();
  dateofbirthController.clear();
  genderController.clear();
  nationallityController.clear();
  civilstatusController.clear();
  religionController.clear();
  fathernameController.clear();
  mothernameController.clear();
  languageknownController.clear();
  addressController.clear();
}

@override
void dispose() {
  nameController.dispose();
  ageController.dispose();
  dateofbirthController.dispose();
  genderController.dispose();
  nationallityController.dispose();
  civilstatusController.dispose();
  religionController.dispose();
  fathernameController.dispose();
  mothernameController.dispose();
  languageknownController.dispose();
  qualificationController.dispose();
  addressController.dispose();
  
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('bio data')),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: dateofbirthController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: nationallityController,
              decoration: const InputDecoration(
                labelText: 'Nationallity',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: civilstatusController,
              decoration: const InputDecoration(
                labelText: 'Civil Status',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: religionController,
              decoration: const InputDecoration(
                labelText: 'Religion',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: fathernameController,
              decoration: const InputDecoration(
                labelText: 'Father\'s name ',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: mothernameController,
              decoration: const InputDecoration(
                labelText: 'mother\'s name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: languageknownController,
              decoration: const InputDecoration(
                labelText: 'Language Known',
                border: OutlineInputBorder(),
              ),
            ),

             const SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'address',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}