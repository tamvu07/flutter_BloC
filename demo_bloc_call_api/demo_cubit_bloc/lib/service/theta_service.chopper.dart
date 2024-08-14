// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ThetaService extends ThetaService {
  _$ThetaService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ThetaService;

  @override
  Future<Response<Result<LoginOutPutModel>>> login(LoginInPutModel loginModel) {
    final Uri $url = Uri.parse('authen/v1/api/auth/client');
    final $body = loginModel;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Result<LoginOutPutModel>, LoginOutPutModel>($request);
  }
}
