import 'package:bloc/app/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Get.arguments as User;
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Page"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar!),
            ),
            SizedBox(height: 10),
            Text(user.firstName! + " " + user.lastName!)
          ],
        ));
  }
}
