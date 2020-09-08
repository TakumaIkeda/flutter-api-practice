import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_practice/models/User.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserScreenController extends ChangeNotifier {
  List users = [];

  Future fetchUser () async {
    final res = await http.get('${DotEnv().env['HOST']}:${DotEnv().env['PORT']}/get');

    if (res.statusCode == 200) {
      List userJson = json.decode(res.body);
      this.users = userJson.map((user) => User(user['name'], user['email'])).toList();
    } else {
      throw Exception('Failed to load user');
    }

    notifyListeners();
  }
}