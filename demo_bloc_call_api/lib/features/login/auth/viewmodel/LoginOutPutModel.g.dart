// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginOutPutModel.dart';

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
