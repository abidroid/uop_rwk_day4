

import 'package:flutter/material.dart';
import 'package:uop_rwk_day4/screens/add_student_screen.dart';
import 'package:uop_rwk_day4/screens/country_list_screen.dart';
import 'package:uop_rwk_day4/screens/sp_screen.dart';
import 'package:uop_rwk_day4/screens/student_list_screen.dart';
import 'package:uop_rwk_day4/screens/update_student_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  var nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"),
      backgroundColor: Colors.teal,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white
                ),
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const SpScreen();
                  }));

                }, child: const Text("Shared Preferences")),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white
                ),
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const AddStudentScreen();
                  }));


                }, child: const Text("SQLITE DB Screen")),

              TextField(
                controller: nameC,

                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),


            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white
                ),
                onPressed: (){

                  String naam = nameC.text.trim();

                  // if( naam.isEmpty){
                  //   return;
                  // }

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return UpdateStudentScreen(name: naam,);
                  }));

                }, child: const Text("Update Student")),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white
                ),
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  StudentListScreen(incomingName: nameC.text.trim(),);
                  }));


                }, child: const Text("Student List Screen")),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white
                ),
                onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  CountryListScreen();
                  }));


                }, child: const Text("Countries")),
          ],
        ),
      ),
    );
  }
}
