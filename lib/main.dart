import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '1_add/UI/frist.dart';
import '1_add/delete.dart';
import '2/hero.dart';
import '3/Ui/bottombar.dart';
import '3/Ui/intro.dart';
import '3/delete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen98()//MyHomePage()
    );
  }
}

