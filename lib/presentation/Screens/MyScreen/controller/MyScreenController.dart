import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../Model/myModel.dart';

class MyScreenController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};

  SampleApi sampleApiobj = SampleApi();
  
  

  Future fetchData() async {
    notifyListeners();
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      sampleApiobj = SampleApi.fromJson(decodedData);
    } else {
      print("Api Failed");
    }
    notifyListeners();
  }

  //post

  Future postData({required String name, required String des}) async {
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.post(url);
    if (response.statusCode == 200) {
      await fetchData();
    } else {
      print("Api Failed");
    }
  }
}

