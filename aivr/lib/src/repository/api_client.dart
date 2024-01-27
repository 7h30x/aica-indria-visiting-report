import '../config.dart' show loginUrl, apiBaseUrl;
import 'package:dio/dio.dart';

enum RequestType { GET, POST, PUT, DELETE }

class ApiLoginResponse {
  String serialUser;
  String name;
  String username;
  String email;
  String accountType;
  String? phone;
  String? sex;
  String? alamat;
  String? serialRoleUser;
  String? serialLokasi;
  String? serialDivisi;
  String? profPic;
  int? status;
  int? statusUserMenu;
  String? serialJabatan;
  String? namaJabatan;
  String? levelJabatan;

  ApiLoginResponse({
    required this.serialUser,
    required this.name,
    required this.username,
    required this.email,
    required this.accountType,
    this.phone,
    this.sex,
    this.alamat,
    this.serialRoleUser,
    this.serialLokasi,
    this.serialDivisi,
    this.profPic,
    this.status,
    this.statusUserMenu,
    this.serialJabatan,
    this.namaJabatan,
    this.levelJabatan,
  });
}

class ApiClient {
  static final ApiClient _instance = ApiClient._privateConstructor();
  final _dio = Dio();

  ApiClient._privateConstructor();
  factory ApiClient() {
    //singleton method
    return _instance;
  }

  Future<Response> executeRequest({
    required RequestType method,
    required String url,
    Map<String, dynamic> params = const {},
    dynamic formData,
    String jsonData = "",
  }) async {
    try {
      Future<Response> response = switch (method) {
        RequestType.GET => _dio.get(url, queryParameters: params),
        RequestType.POST => _dio.post(url, data: formData),
        _ => _dio.get(url),
      };
      //chain Future responses
      return await response;
    } on DioException catch (e) {
      String message = e.message!;
      // print(e.response.toString());
      if (e.response != null) {
        return Response(
          requestOptions: e.requestOptions,
          statusCode: e.response?.statusCode ?? 500,
          data: {'error': message},
        );
      } else {
        return Response(
          requestOptions: e.requestOptions,
          statusCode: null,
          data: {'error': message},
        );
      }
    }
  }
}
