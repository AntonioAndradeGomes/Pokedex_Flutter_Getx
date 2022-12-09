import 'dart:convert';
import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {
  Future<Map<dynamic, dynamic>> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {};
    final dio = Dio();
    try {
      final response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );
      var data = jsonDecode(response.data);
      return data;
    } on DioError catch (err) {
      return err.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }
}
