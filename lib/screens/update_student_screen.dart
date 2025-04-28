
import 'package:flutter/material.dart';

class UpdateStudentScreen extends StatelessWidget {

  final String name;

  const UpdateStudentScreen({super.key, required this.name});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('update student'),),

      body: Text(name, style: TextStyle(fontSize: 40),),
    );


  }
}
