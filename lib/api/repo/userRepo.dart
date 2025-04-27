import 'package:flutter/material.dart';
import 'package:untitled/api/model/userModel.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<List<UserModel>> getUsers() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
