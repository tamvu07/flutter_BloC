import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/SharedPreferences/SaveToken.dart';
import 'package:demo_cubit_bloc/model/loginOutPutModel.dart';

enum ModelsResponseType {
  login,
  services,
  timezone,
  devices,
  urgencySetting,
}



class ModelConverter implements Converter {
  final ModelsResponseType modelType;
  ModelConverter({required this.modelType});

  @override
  Future<Request> convertRequest(Request request) async {
    final authToken = await SaveToken.getToken();
    print("a2.......authToken......is: $authToken..");

    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );
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
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
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
      switch (modelType) {
        case ModelsResponseType.login:
          final auth = LoginOutPutModel.fromJson(mapData);
          print("a2.......login........");
          return response.copyWith<BodyType>(body: Success(auth) as BodyType);

        case ModelsResponseType.urgencySetting:
          print("a2.......ModelsResponseType.urgencySetting........");
          return response.copyWith<BodyType>(
              body: Success(mapData) as BodyType);

        default:
          print("a2.......222........");
          final auth = LoginOutPutModel.fromJson(mapData);
          return response.copyWith<BodyType>(body: Success(auth) as BodyType);
      }
    } catch (e) {
      // 6
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(
          body: ErrorTemp(e as Exception) as BodyType);
    }
  }
}

abstract class Result<T> {}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class ErrorTemp<T> extends Result<T> {
  final Exception exception;
  ErrorTemp(this.exception);
}

class APIException implements Exception {
  final String message;

  APIException(this.message);

  @override
  String toString() {
    return 'APIException: $message';
  }
}
