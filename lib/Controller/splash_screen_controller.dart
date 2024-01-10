import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:databaselocal/pages/homepage_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    initDatabase();
    super.onReady();
  }

  Database? database;
  Future initDatabase() async {
    String db_name = "db_user";
    int db_version = 1;
    String table = "user";
    String id = "id";
    String name = "name";
    String email = "email";
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + db_name;

    if (database == null) {
      database = await openDatabase(path, version: db_version,
          onCreate: (db, version) {
        db.execute('''          
        CREATE TABLE IF NOT EXISTS $table (
              $id INTEGER PRIMARY KEY AUTOINCREMENT,
              $name VARCHAR(255),
              $email VARCHAR(255)
            )''');
      });
      print(database);
      Get.off(HomePage());
    } else {
      Get.off(HomePage());
    }
  }
}
