
import 'package:demo_bloc_call_api/features/login/auth/viewmodel/LoginOutPutModel.dart';
import 'package:demo_bloc_call_api/features/login/auth/viewmodel/loginInPutModel.dart';
import 'package:chopper/chopper.dart';
import 'model_converter.dart';
part 'auth_service.chopper.dart';

String apiUrl = 'https://api.onskycloud.com';


@ChopperApi()
abstract class AuthService extends ChopperService {
  @Post(path: 'authen/v1/api/auth/client')
  Future<Response<Result<LoginOutPutModel>>> login(@Body() LoginInPutModel loginModel);

  static AuthService create() {
    final client = ChopperClient(
      // 2
      baseUrl: Uri.tryParse(apiUrl),
      // 3
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      // 4
      converter: ModelConverter(),
      // 5
      errorConverter: const JsonConverter(),
      // 6
      services: [
        _$AuthService(),
      ],
    );
    // 7
    return _$AuthService(client);
  }
}



// import 'package:chopper/chopper.dart';
// import 'package:flutter/material.dart';

// part 'auth_service.chopper.dart';

// @ChopperApi(baseUrl: '')
// abstract class PostApiService extends ChopperService {

//   @Get(headers: {'abc': '123'})
//   Future<Response> getPosts(
//     @Header('header-name') String headerValue
//   );

//   @Get(path: '/{id}')
//   Future<Response> getPost(@Part('id') int id);

//   @Post()
//   Future<Response> postPost(
//     @Body() Map<String, dynamic> body
//   );

// }