import 'dart:ffi';

import 'package:bloc/app/api/user_api.dart';
import 'package:bloc/app/models/users.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  int _count = 0;
  List<User> _users = [];
  bool? _loading = true;
  List<User> get users => _users;
  bool? get loading => _loading;

  int get count => _count;
  increment() {
    _count++;
    update(['counter'], _count >= 5);
  }

  Future<void> loadUsers() async {
    this._loading = true;
    final data = await UserApi.instance.gexUser(1);
    _users = data;
    this._loading = false;
    update(["users"]);
  }

  @override
  void onInit() {
    // TODO: implement onReady
    super.onReady();
    this.loadUsers();
  }
}
