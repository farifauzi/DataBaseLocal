import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:databaselocal/models/user_model.dart';

class HomepageViewController extends GetxController {
  late Database? database;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<UserModel>> index() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);
    final data = await database!.query('user');
    List<UserModel> user = data.map((e) => UserModel.fromJson(e)).toList();
    return user;
  }

  // Future<int> store(UserModel user) async {
  //   final data = await database!.insert('user', user.toJson());
  //   return data;
  // }

  Future<void> delete(int id) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    // Delete the record from the 'user' table where the ID matches
    await database!.delete('user', where: 'id = ?', whereArgs: [id]);
  }
}
