import 'package:bloc/app/controllers/counterController.dart';
import 'package:bloc/app/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      init: CounterController(),
      builder: (counterController) {
        print("Build a home");
        return Scaffold(
          body: Center(
            child: GetBuilder<CounterController>(
                id: 'users',
                builder: (_) {
                  print("Build a simple widget");
                  if (_.loading!) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: _.users.length,
                      itemBuilder: (__, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(Profile(), arguments: _.users[index]);
                          },
                          child: ListTile(
                            trailing: CircleAvatar(
                              radius: 50,
                              child: Image.network(_.users[index].avatar!),
                            ),
                            title: Text(_.users[index].firstName!),
                            subtitle: Text(
                              _.users[index].lastName!,
                            ),
                          ),
                        );
                      });
                }),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              counterController.increment();
            },
          ),
        );
      },
    );
  }
}
