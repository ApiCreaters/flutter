import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getx/GetxControl.dart';
import 'frist.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final MyController controller = Get.put(MyController()); // Initialize the controller
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Enter a Key',
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                // Add data to the RxMap
                final key = textController.text;
                final value = 'Value for $key';
                controller.myData[key] = value;
                textController.clear(); // Clear the text field
              },
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}
