import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_status_code/http_status_code.dart';
import 'package:retry/retry.dart';

import '../../helpers/kat_helpers.dart';
import '../../models/enums/request_type.dart';

class ApiHandler {
  /// class name
  static const String _cn = 'ApiHandler';
  static final _log = KatHelpers.getLogger(_cn);

  static String _initLog({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Object? body,
  }) {
    final timeId = '${DateTime.now().second}${DateTime.now().millisecond}';

    _log.v('''
${type.name.toUpperCase()} request (time id: $timeId)
  url: $url,
  headers: $headers,
  body: $body,
''');

    return timeId;
  }

  static _handleResponse({
    required http.Response response,
    required String timeId,
  }) {
    final statusCode = response.statusCode;
    if (response.statusCode != StatusCode.OK) {
      throw Exception('''
failure,  request of time id ( $timeId ) 
  status code: $statusCode
  status code message: ${getStatusMessage(statusCode)}
  body: ${response.body}
''');
    }

    _log.v('success, request of time id: $timeId');
  }

  static Future<T?> _request<T>({
    required BuildContext context,
    required RequestType type,
    required String url,
    required Object? body,
    required Map<String, String>? headers,
    T? Function(http.Response)? onResponse,
    required Future<http.Response> Function() request,
  }) async {
    try {
      final timeId = _initLog(
        type: RequestType.get,
        url: url,
        headers: headers,
        body: body,
      );

      final res = await retry(
        request,
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      _handleResponse(
        response: res,
        timeId: timeId,
      );

      if (onResponse != null) {
        return onResponse(res);
      }
      return null;
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
      return null;
    }
  }

  static final globalHeaders = {
    'Content-Type': 'application/json',
  };

  static Future<T?> get<T>({
    required BuildContext context,
    required String url,
    Map<String, String>? headers,
    T? Function(http.Response)? onResponse,
  }) async =>
      await _request(
        context: context,
        type: RequestType.get,
        url: url,
        headers: headers,
        body: null,
        request: () => http.get(
          Uri.parse(url),
          headers: (headers ?? {})..addAll(globalHeaders),
        ),
        onResponse: onResponse,
      );

  static Future<T?> post<T>({
    required BuildContext context,
    required String url,
    Map<String, String>? headers,
    Object? body,
    T? Function(http.Response)? onResponse,
  }) async =>
      await _request(
        context: context,
        type: RequestType.post,
        url: url,
        headers: headers,
        body: body,
        request: () => http.post(
          Uri.parse(url),
          headers: (headers ?? {})..addAll(globalHeaders),
          body: body,
        ),
        onResponse: onResponse,
      );

  static Future<T?> patch<T>({
    required BuildContext context,
    required String url,
    Map<String, String>? headers,
    Object? body,
    T? Function(http.Response)? onResponse,
  }) async =>
      await _request(
        context: context,
        type: RequestType.patch,
        url: url,
        headers: headers,
        body: body,
        request: () => http.patch(
          Uri.parse(url),
          headers: (headers ?? {})..addAll(globalHeaders),
          body: body,
        ),
        onResponse: onResponse,
      );

  static Future<T?> put<T>({
    required BuildContext context,
    required String url,
    Map<String, String>? headers,
    Object? body,
    T? Function(http.Response)? onResponse,
  }) async =>
      await _request(
        context: context,
        type: RequestType.put,
        url: url,
        headers: headers,
        body: body,
        request: () => http.put(
          Uri.parse(url),
          headers: (headers ?? {})..addAll(globalHeaders),
          body: body,
        ),
        onResponse: onResponse,
      );

  static Future<T?> delete<T>({
    required BuildContext context,
    required String url,
    Map<String, String>? headers,
    Object? body,
    T? Function(http.Response)? onResponse,
  }) async =>
      await _request(
        context: context,
        type: RequestType.delete,
        url: url,
        headers: headers,
        body: body,
        request: () => http.delete(
          Uri.parse(url),
          headers: (headers ?? {})..addAll(globalHeaders),
          body: body,
        ),
        onResponse: onResponse,
      );
}
