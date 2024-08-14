import 'dart:async';
import 'package:chopper/chopper.dart';

part 'theta_service.chopper.dart';

@ChopperApi()
abstract class ThetaService extends ChopperService {
  @Get(
    path: 'authen/v1/api/auth/client',
  )
  Future<Response> login(@body() Login);

  static ThetaService create() {
    return _$ThetaService();
  }
}