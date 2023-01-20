import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kat/kat_local.dart';
import 'package:kat/models/pexel.dart';
import 'package:kat/views/auth/auth_imports.dart';

import 'api_handler.dart';

class PexelsApi {
  static const String _baseUrl = 'https://api.pexels.com/v1';

  /// returns a list of 80 objects corresponding to the provided [query]
  static Future<Pexel?> search(BuildContext context, String query) async {
    final url =

        /// using a random page is just a temporary solution until lazy loading is implemented
        '$_baseUrl/search?query=$query&per_page=80&page=${KatHelpers.randomInt(max: 5)}';

    return await ApiHandler.get<Pexel>(
      context: context,
      url: url,
      headers: {
        'Authorization': KatLocal.pixelsApiKey,
      },
      onResponse: (res) => Pexel.fromJson(jsonDecode(res.body)),
    );
  }
}
