import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/1_add/UI/second.dart';

import '../getx/GetxControl.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({super.key});

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {

  final MyController controller = Get.put(MyController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(SecondScreen());
            }, child: Text("Next")),
            SizedBox(height: 30,),
            Obx(() {
              // Listen to changes in the RxMap and rebuild the widget
              final dataMap = controller.myData;
              final keys = dataMap.keys.toList(); // Get the keys as a list

              return SizedBox(
                height: 450,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: keys.length,
                  itemBuilder: (context, index) {
                    final key = keys[index];
                    final value = dataMap[key];

                    return ListTile(
                      title: Text('Key: $key'),
                      subtitle: Text('Value: $value'),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

TextField TextFont({required String text, required TextEditingController data }){
  return TextField (
    controller: data,
    decoration: InputDecoration(
        border: InputBorder.none,
        labelText: text,
    ),
  );
}