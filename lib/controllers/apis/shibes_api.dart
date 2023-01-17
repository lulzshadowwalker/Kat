import 'dart:convert';

import 'package:flutter/material.dart';

import 'api_handler.dart';

class ShibesApi {
  static const String _baseUrl = 'http://shibe.online/api';

  /// returns a list of 100 shibe image urls
  static Future<List<String>> fetchShibes(BuildContext context) async {
    const url = '$_baseUrl/shibes?count=100';

    return await ApiHandler.get<List<String>>(
          context: context,
          url: url,
          onResponse: (res) => (jsonDecode(res.body) as List)
              .map(
                (e) => e.toString(),
              )
              .toList(),
        ) ??
        [];
  }

  /// returns a list of 100 bird image urls
  static Future<List<String>> fetchBirds(BuildContext context) async {
    const url = '$_baseUrl/birds?count=100';

    return await ApiHandler.get<List<String>>(
          context: context,
          url: url,
          onResponse: (res) => (jsonDecode(res.body) as List)
              .map(
                (e) => e.toString(),
              )
              .toList(),
        ) ??
        [];
  }
}
