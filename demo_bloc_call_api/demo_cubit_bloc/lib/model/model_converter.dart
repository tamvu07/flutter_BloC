import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:demo_cubit_bloc/model/loginOutPutModel.dart';


class ModelConverter implements Converter {

  @override
  Request convertRequest(Request request) {
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
        body: ErrorTemp(APIException('HTTP ${response.statusCode}')) as BodyType,
      );
    }
      // 4
      final auth = LoginOutPutModel.fromJson(mapData);

      // 5
      return response.copyWith<BodyType>(body: Success(auth) as BodyType);
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
