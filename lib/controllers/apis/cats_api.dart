import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:kat/controllers/apis/api_handler.dart';
import 'package:kat/kat_local.dart';
import '../../models/cat.dart';

class CatsApi {
  static const String _baseUrl = 'https://cataas.com/api';

  /// returns a list of 1000 images
  static Future<List<Cat>> fetchCats(BuildContext context) async {
    const url = '$_baseUrl/cats?limit=1000';

    return await ApiHandler.get<List<Cat>>(
          context: context,
          url: url,
          headers: {
            'x-api-key': KatLocal.theCatApiKey,
          },
          onResponse: (res) => (jsonDecode(res.body) as List)
              .map((e) => Cat.fromJson(e))
              .toList(),
        ) ??
        [];
  }

  /// returns a list of all avaialable tags
  static Future<List<String>> fetchTags(BuildContext context) async {
    const url = '$_baseUrl/tags';

    return await ApiHandler.get<List<String>>(
          context: context,
          url: url,
          onResponse: (res) => (jsonDecode(res.body) as List)
              .map((e) => e.toString())
              .where((e) => e.isNotEmpty)
              .toList()
            ..sort(),
        ) ??
        [];
  }
}
