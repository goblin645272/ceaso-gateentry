import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Entry {
  String? sId;
  String? comments;
  String? createdName;
  CollectionDetails? collectionDetails;
  CustomerDetails? customerDetails;
  List<ItemsList>? itemsList;
  String? recievingDetails;
  ShippingDetails? shippingDetails;
  String? timestamp;
  String? uniqueId;

  Entry(
      {this.sId,
      this.comments,
      this.createdName,
      this.collectionDetails,
      this.customerDetails,
      this.itemsList,
      this.recievingDetails,
      this.shippingDetails,
      this.timestamp,
      this.uniqueId});

  Entry.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    collectionDetails = json['collection_details'] != null
        ? CollectionDetails.fromJson(json['collection_details'])
        : null;
    comments = json['comments'];
    createdName = json['created_name'];
    customerDetails = json['customer_details'] != null
        ? CustomerDetails.fromJson(json['customer_details'])
        : null;
    if (json['items_list'] != null) {
      itemsList = <ItemsList>[];
      json['items_list'].forEach((v) {
        itemsList!.add(ItemsList.fromJson(v));
      });
    }
    recievingDetails = json['recieving_details'];
    shippingDetails = json['shipping_details'] != null
        ? ShippingDetails.fromJson(json['shipping_details'])
        : null;
    timestamp = json['timestamp'];
    uniqueId = json['uniqueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    if (collectionDetails != null) {
      data['collection_details'] = collectionDetails!.toJson();
    }
    data['comments'] = comments;
    data['created_name'] = createdName;
    if (customerDetails != null) {
      data['customer_details'] = customerDetails!.toJson();
    }
    if (itemsList != null) {
      data['items_list'] = itemsList!.map((v) => v.toJson()).toList();
    }
    data['recieving_details'] = recievingDetails;
    if (shippingDetails != null) {
      data['shipping_details'] = shippingDetails!.toJson();
    }
    data['timestamp'] = timestamp;
    data['uniqueId'] = uniqueId;
    return data;
  }
}

class CollectionDetails {
  String? employeeName;
  String? timestamp;

  CollectionDetails({this.employeeName, this.timestamp});

  CollectionDetails.fromJson(Map<String, dynamic> json) {
    employeeName = json['employee_name'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_name'] = employeeName;
    data['timestamp'] = timestamp;
    return data;
  }
}

class CustomerDetails {
  String? address;
  String? name;

  CustomerDetails({this.address, this.name});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}

class ItemsList {
  String? description;
  String? packQuantity;

  ItemsList({this.description, this.packQuantity});

  ItemsList.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    packQuantity = json['pack_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['pack_quantity'] = packQuantity;
    return data;
  }
}

class ShippingDetails {
  String? courierName;
  String? name;
  String? typeOfShipment;
  String? phone;

  ShippingDetails({this.courierName, this.name, this.typeOfShipment});

  ShippingDetails.fromJson(Map<String, dynamic> json) {
    courierName = json['courier_name'];
    name = json['name'];
    phone = json['phone'];
    typeOfShipment = json['type_of_shipment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courier_name'] = courierName;
    data['name'] = name;
    data['phone'] = phone;
    data['type_of_shipment'] = typeOfShipment;
    return data;
  }
}

Future<List<Entry>> fetchentrylist(Uri url, Map<String, String> headers) async {
  final response = await http.get(url, headers: headers);
  return compute(parseentrylist, response.body);
}

void updateentrylist(
    Uri url, Map<String, String> headers, Map<String, String> body) async {
  await http.put(url, headers: headers, body: json.encode(body));
}

List<Entry> parseentrylist(String responseBody) {
  var list = json.decode(responseBody)['data'] as List<dynamic>;
  var entryList = list.map((model) => Entry.fromJson(model)).toList();
  return entryList;
}
