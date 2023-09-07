import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  final MyController controller = Get.put(MyController()); // Initialize the controller
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX RxMap Example'),
      ),
      body: Center(
        child: ListView(
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




class MyController extends GetxController {
  final RxMap<String, dynamic> myData = <String, dynamic>{}.obs;
}
