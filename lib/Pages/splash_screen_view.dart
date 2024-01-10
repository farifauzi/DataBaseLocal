import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:databaselocal/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
