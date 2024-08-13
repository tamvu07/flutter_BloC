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
  Future<Response<dynamic>> thetaInfo() {
    final Uri $url = Uri.parse('/osc/info');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
