import 'dart:convert';

import 'package:dio/dio.dart';

import '../Model/User.dart';

class ApiService {
  static final dio = Dio();

  static Future<List<AllUsers>?> callApi() async {
    final response = await dio
        .post('https://friendly-cohen.3-16-11-30.plesk.page/api/all-users');
    var map = Map<String, dynamic>.from(response.data);
    var responseNew = User.fromJson(map);
    List<AllUsers>? allUSer = responseNew.data!.allUsers;
    return allUSer;
  }
}
