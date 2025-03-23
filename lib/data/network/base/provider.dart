import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc/config/environment.dart';
import 'package:sample_bloc/data/network/base/param.dart';

import 'exception.dart';
import 'interceptor.dart';

class ApiProvider {
  static final ApiProvider instance = ApiProvider._internal();

  ApiProvider._internal();

  factory ApiProvider() {
    return instance;
  }


  Future<void> init() async {
    _dio.interceptors.add(CustomInterceptor());
    _dio.options.connectTimeout = const Duration(minutes: 1);
    configCharles();
  }


  final _dio = Dio();

  Future<void> configCharles() async {
    if (!Environment.flavor.supportCharles) return;

    final charlesIp = _charlesIp;
    if (charlesIp.isEmpty) return;

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        return HttpClient()
          ..findProxy = (uri) {
            return 'PROXY $charlesIp:8888;';
          }
          ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      },
    );
  }

  String get _charlesIp {
    const charlesIp = String.fromEnvironment('CHARLES_PROXY_IP');
    if (charlesIp.isNotEmpty) return charlesIp;
    return '';
  }

  Future<dynamic> requestApi({required ApiParam param}) async {
    final method = param.method;
    final url = param.url + param.path;
    final json = param.toJson()..removeWhere((key, value) => value == null);
    final queryParameters = (method == Method.get) ? json : null;
    final data = (method == Method.get)
        ? null
        : (param.contentType == HeaderContentType.applicationXWwwFormUrlencoded
            ? json
            : jsonEncode(json));

    debugPrint('REQUEST API: ${param.name.name}');
    try {
      final response = await _dio.request<dynamic>(
        url,
        data: param.data ?? data,
        queryParameters: (param.queryParameters ?? queryParameters),
        options: param.options,
      );
      return response.data;
    } on SocketException catch (e) {
      debugPrint(e.message);
      throw ApiException(url: url);
    } on DioException catch (e) {
      debugPrint(e.message);
      if (e.type == DioExceptionType.cancel) return null;

      final httpStatus = e.response?.statusCode;
      final data = e.response?.data;
      final message = _getErrorMessage(data);
      throw ApiException(
        httpCode: httpStatus,
        message: message,
        url: url,
      );
    } catch (e) {
      throw ApiException(message: e.toString(), url: url);
    }
  }

  String? _getErrorMessage(dynamic errorResponse) {
    /// TODO: Get error message
    return null;
  }

  Future<dynamic> upload(ApiParam param) async {
    final url = param.url + param.path;
    debugPrint('UPLOAD API: ${param.name.name}');
    try {
      final data = FormData.fromMap(param.toJson());
      final response = await _dio.post<dynamic>(
        url,
        data: data,
        options: param.options,
      );
      return response;
    } on SocketException catch (e) {
      debugPrint(e.message);
      throw ApiException(url: url);
    } on DioException catch (e) {
      debugPrint(e.message);
      if (e.type == DioExceptionType.cancel) return null;

      final httpStatus = e.response?.statusCode;
      final data = e.response?.data;
      final message = _getErrorMessage(data);
      throw ApiException(
        httpCode: httpStatus,
        message: message,
        url: url,
      );
    } catch (e) {
      throw ApiException(message: e.toString(), url: url);
    }
  }
}
