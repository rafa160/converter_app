//import 'package:async/async.dart';
//import 'package:http/http.dart' as http;
//
//import 'dart:convert';
//
//const request = "https://api.hgbrasil.com/finance?format=json&key=9e65b260";
//
//class Api{
//
//  Future<Map> getData() async {
//    http.Response response = await http.get(request);
//    print(json.decode(response.body));
//    return json.decode(response.body);
//  }
//
//  Future<Map> getUsd() async {
//    http.Response response = await http.get(request);
//    print(json.decode(response.body)["results"]["currencies"]["USD"]);
//    return json.decode(response.body)["results"]["currencies"]["USD"];
//  }
//
//
//  Future<Map> getEur() async {
//    http.Response response = await http.get(request);
//    print(json.decode(response.body)["results"]["currencies"]["EUR"]);
//    return json.decode(response.body)["results"]["currencies"]["EUR"];
//  }
//
//
//  Future<Map> getPound() async {
//    http.Response response = await http.get(request);
//    print(json.decode(response.body)["results"]["currencies"]["GBP"]);
//    return json.decode(response.body)["results"]["currencies"]["GBP"];
//  }
//
//
//
//}