import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/SharedPreferences/SaveToken.dart';
import 'package:demo_cubit_bloc/model/loginOutPutModel.dart';
import 'package:demo_cubit_bloc/model/model_converter.dart';

class ModelTokenConverter implements Converter {
  @override
  Future<Request> convertRequest(Request request) async {

    print("a2....token123.......");
    final req = applyHeader(
        request,
        contentTypeKey,
        jsonHeaders,
        override: false,
      );

      // return applyHeader(
      //   req,
      //   'Authorization',
      //   'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoxMjIyLCJjX24iOiIyODI2MjEwMTg2MTA3MDI4Njc1IiwiZXhwIjoxNzIzNzI1NjUxLCJpZCI6MTIxMywiciI6NSwidSI6InVzZXJAeWFob28uY29tIiwidV91aWQiOiJlZDlhNTQzNC02ZWY2LTRhZTctYTI2Ni03MTlkZjJlZTk3NjAifQ.hLp0opi-XXisYFdQNU1qWdDzwUKJH2KJoIjfSqyqx9s',
      //   override: false,
      // );
      return encodeJson(req);
  }

  Request encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];

    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response response) {
    // 1
    return decodeJson<BodyType, InnerType>(response);
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    final contentType = response.headers[contentTypeKey];
    var body = response.body;
    // 1
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      // 2
      final mapData = json.decode(body);
      // 3
      if (mapData['status'] != null) {
        return response.copyWith<BodyType>(
            body: ErrorTemp(Exception(mapData['status'])) as BodyType);
      }

      if (mapData['error'] != null) {
        return response.copyWith<BodyType>(
          body: ErrorTemp(APIException(mapData['error'])) as BodyType,
        );
      }

      if (response.statusCode >= 400) {
        return response.copyWith<BodyType>(
          body: ErrorTemp(APIException('HTTP ${response.statusCode}'))
              as BodyType,
        );
      }
      return response.copyWith<BodyType>(body: Success(mapData) as BodyType);
    } catch (e) {
      // 6
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
          body: ErrorTemp(e as Exception) as BodyType);
    }
  }
}
