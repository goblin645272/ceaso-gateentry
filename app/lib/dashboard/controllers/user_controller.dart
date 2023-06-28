import 'dart:convert';
import 'package:app/dashboard/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User extends ChangeNotifier {
  String? id;
  String? email;
  int? employeeCode;
  String? name;
  String? token;
  bool? collectionAuth;

  User({
    this.id,
    this.email,
    this.employeeCode,
    this.name,
    this.token,
    this.collectionAuth,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    employeeCode = json['employee_code'];
    name = json['name'];
    token = json['token'];
    collectionAuth = json['collection_auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['employee_code'] = employeeCode;
    data['name'] = name;
    data['token'] = token;
    data['collection_auth'] = collectionAuth;
    return data;
  }

//QBD/23-24/JUN/GEN9999

  void signIn(int funcemployeeCode, String password, Function callback) async {
    Uri url = Uri.parse("$apiUrl/user/login/");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: json.encode(
        {
          "employee_code": funcemployeeCode,
          "password": password,
        },
      ),
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      var user = User.fromJson(responsebody['data']);
      id = user.id;
      employeeCode = user.employeeCode;
      email = user.email;
      name = user.name;
      token = user.token;
      collectionAuth = user.collectionAuth;
    }
    callback(true);
    notifyListeners();
  }
}

Future<List<User>> fetchCollectionAuthUserlist(
    Uri url, Map<String, String> headers) async {
  final response = await http.get(url, headers: headers);
  return compute(parseUserlist, response.body);
}

List<User> parseUserlist(String responseBody) {
  var list = json.decode(responseBody)['data'] as List<dynamic>;

  var userList = list.map((model) => User.fromJson(model)).toList();
  userList =
      userList.where((element) => element.collectionAuth == true).toList();
  return userList;
}
