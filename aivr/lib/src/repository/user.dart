import 'dart:convert';

import 'package:aivr/src/enum/request_status.dart';
import 'package:dio/dio.dart';
import '../model/user_model.dart';
import './api_client.dart';

class UserRepository {
  static final _client = ApiClient();
  void update() {
    // Implementation goes here
  }

  // static Future<User>? login(String username, String password) async {
  //   Future<Response> = await _client.executeRequest(method: RequestType.POST, url: url);
  //   // handle error
  //   // otherwise, return the logged in user details.
  // }
  static Future<bool> testLogin(String username, String password) async {
    Response<ApiLoginResponse> response = await Future.delayed(
        const Duration(seconds: 1),
        () => Response(
            requestOptions: RequestOptions(),
            data: ApiLoginResponse(
                serialUser: "pXInnEfer42jRXdLC4t1ONuPc5bSaCzG",
                accountType: "test",
                name: "login_test",
                username: "login_test",
                email: "login_test@lem-fox.com")));

    // TODO: handle error
    // otherwise, update the user model
    UserModel user = UserModel();
    user.apiLogin(
        id: response.data!.serialUser,
        username: response.data!.username,
        email: response.data!.email);
    return false;
  }

  static void forgetPassword() {
    // Implementation goes here
  }
}

class InternalMessage<T> {
  String message;
  RequestStatus status;
  T? data;
  InternalMessage({required this.status, this.message = "", this.data});
}
