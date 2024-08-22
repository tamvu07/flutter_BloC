// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_out_put_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOutPutModel _$LoginOutPutModelFromJson(Map<String, dynamic> json) =>
    LoginOutPutModel(
      token: json['token'] as String,
      expires: json['expires'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$LoginOutPutModelToJson(LoginOutPutModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
      'refresh_token': instance.refreshToken,
    };
