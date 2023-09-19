import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/4/controller/userControle.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(userController.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
          itemCount: userController.userList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.lightBlueAccent,
                child: ListTile(
                  title: Text(userController.userList[index].name),
                  subtitle: Text(userController.userList[index].email),
                  leading: Text(userController.userList[index].address.geo.lat),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
