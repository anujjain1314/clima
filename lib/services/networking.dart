import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final String url;

  NetworkingHelper({@required this.url});

  Future getData() async {
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print('Response body: $data}');
      return jsonDecode(response.body);
    } else {
      //print('Response status: ${response.statusCode}');
    }
  }
}
