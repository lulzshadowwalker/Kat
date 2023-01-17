import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kat/controllers/apis/api_handler.dart';

class DogsApi {
  static const String _baseUrl = 'https://dog.ceo/api';

  static Future<List<String>> fetchDogs(BuildContext context) async {
    const url = '$_baseUrl/breed/hound/images';

    return await ApiHandler.get<List<String>>(
          context: context,
          url: url,
          onResponse: (res) => (jsonDecode(res.body)['message'] as List)
              .map((e) => e.toString())
              .toList(),
        ) ??
        [];
  }
}
