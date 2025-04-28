

import 'package:flutter/material.dart';

class SpScreen extends StatefulWidget {
  const SpScreen({super.key});

  @override
  State<SpScreen> createState() => _SpScreenState();
}

class _SpScreenState extends State<SpScreen> {

  // initial state
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Prefs"),
        backgroundColor: Colors.teal,

      ),
      body: Column(
        children: [
          Text(counter.toString()),
          ElevatedButton(onPressed: (){
            setState(() {
              counter++;
            });
          }, child: const Text('Increment'))
        ],
      ),
    );  }
}
