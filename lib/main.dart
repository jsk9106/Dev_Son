import 'package:dev_son/controller/about_me_controller.dart';
import 'package:dev_son/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev_Son',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder((){
        Get.put(AboutMeController());
      }),
      home: MainScreen(),
    );
  }
}

