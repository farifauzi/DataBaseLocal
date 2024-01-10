import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:databaselocal/models/user_model.dart';
import 'package:databaselocal/pages/homepage_view.dart';

class EditDataController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController idTextController = TextEditingController();
  late Database? database;

  var data = [].obs;

  void insert() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    List<dynamic> userData = data.value;

    UserModel user = UserModel(
      id: userData[0],
      name: nameTextController.text,
      email: emailTextController.text,
    );

    await database!
        .update('user', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
    Get.offAll(HomePage());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    List<dynamic> userData = data.value;
    nameTextController.text = userData[1];
    emailTextController.text = userData[2];
    super.onReady();
  }
}
