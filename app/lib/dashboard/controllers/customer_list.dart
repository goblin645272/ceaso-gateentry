import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Customer {
  String? id;
  String? address;
  String? name;

  Customer({this.id, this.address, this.name});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}

Future<List<Customer>> fetchcustomerlist(
    Uri url, Map<String, String> headers) async {
  final response = await http.get(url, headers: headers);
  return compute(parsecustomerlist, response.body);
}

List<Customer> parsecustomerlist(String responseBody) {
  var list = json.decode(responseBody)['data'] as List<dynamic>;
  var customerList = list.map((model) => Customer.fromJson(model)).toList();
  return customerList;
}
