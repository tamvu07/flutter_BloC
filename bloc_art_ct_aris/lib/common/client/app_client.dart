
import 'package:bloc_art_ct_aris/common/client/api_paths.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class AppClient with DioMixin implements Dio {

  Future<void> initData() async {
    var options = BaseOptions(
      baseUrl: BASE_URL,
      contentType: 'application/json', 
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    // var sharedPrefs = await SharedPreferences.getInstance();
    // options.headers['Authorization'] =
    //     'Bearer ${sharedPrefs.getString('token')}';

    this.options = options;

    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Future<Dio> getInstance() async {
    var client = AppClient();
    await client.initData();
    return client;
  }
  
}