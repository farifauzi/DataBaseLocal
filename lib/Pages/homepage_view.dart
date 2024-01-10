import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:databaselocal/controller/home_page_controller.dart';
import 'package:databaselocal/models/user_model.dart';
import 'package:databaselocal/Pages/edit_data.dart';
import 'package:databaselocal/Pages/form_data_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomepageViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FLutter SQFlite CRUD"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<UserModel>>(
            future: controller.index(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      UserModel user = snapshot.data![index];
                      print(user.name);
                      return ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text(user.name! ?? ""),
                        subtitle: Text(user.email! ?? ""),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.delete(user.id!);
                                  Get.offAll(HomePage());
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  print(user.name!);
                                  Get.to(EditDataView(), arguments: [
                                    user.id,
                                    user.name,
                                    user.email!
                                  ]);
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
              onPressed: () {
                Get.to(FormDataView());
              },
              child: Icon(Icons.add)),
        ));
  }
}
