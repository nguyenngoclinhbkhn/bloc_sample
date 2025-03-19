import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jsnavineo_app/database/share_preferences/share_preferences_utils.dart';
import 'package:jsnavineo_app/utils/map.dart';

abstract class ApiParam {
  ApiName get name;

  Map<String, dynamic>? get queryParameters => null;

  dynamic get data => null;

  Map<String, dynamic> toJson() => {};

  String get path;

  List<int> get validateStatus => [HttpStatus.ok];

  String get url {
    final url = SharePreferenceUtils.instance.getUrl();
    if (!Uri.parse(url).isAbsolute) {
      throw Exception("Base URL '$url' is not absolute");
    }
    return url;
  }
}

extension ApiParamExt on ApiParam {
  Options get options => Options(
    method: method,
    validateStatus: (status) => validateStatus.contains(status),
    headers: headers,
    responseType: responseType,
  );

  ResponseType? get responseType {
    switch (name) {
      case ApiName.getByte:
        return ResponseType.bytes;
      case _:
        return null;
    }
  }

  String get method {
    switch (name) {
      case ApiName.get:
      case ApiName.getByte:
        return Method.get;
      case ApiName.post:
        return Method.post;
      case ApiName.put:
        return Method.put;
      case ApiName.delete:
        return Method.delete;
    }
  }

  Map<String, dynamic> get headers {
    final headers = <String, dynamic>{};
    headers[HeaderContentType.contentType] = contentType;
    return headers..removeWhere((key, value) => value == null || value == '');
  }

  String? get contentType {
    switch (name) {
      case ApiName.get:
      case ApiName.post:
      case ApiName.put:
      case ApiName.delete:
        return null;

      case _:
        return null;
    }
  }
}

final class HeaderContentType {
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String imageJpeg = 'image/jpeg';
  static const String applicationXWwwFormUrlencoded =
      'application/x-www-form-urlencoded';
  static const String multipartFormData = 'multipart/form-data';
}

class Method {
  static const String get = 'get';
  static const String post = 'post';
  static const String patch = 'patch';
  static const String put = 'put';
  static const String delete = 'delete';
}

enum ApiName { get, post, put, delete, getByte }
