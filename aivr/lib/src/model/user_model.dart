import 'package:aivr/src/repository/api_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  static final UserModel _instance = UserModel._privateConstructor();
  UserModel._privateConstructor();
  factory UserModel() {
    //singleton method
    return _instance;
  }

  String? id;
  String? username;
  String? email;
  bool isLoggedIn = false;

  void apiLogin(
      {required String id, required String username, required String email}) {
    this.id = id;
    this.username = username;
    this.email = email;
    isLoggedIn = true;
  }

  // Method to display user information
  String get userInfo => 'ID: $id, Name: $username, Email: $email}';

  // Additional methods can be added here, such as toJson, fromJson, etc.
}
