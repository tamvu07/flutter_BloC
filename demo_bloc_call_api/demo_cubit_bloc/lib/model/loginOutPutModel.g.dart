// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginOutPutModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOutPutModel _$LoginOutPutModelFromJson(Map<String, dynamic> json) =>
    LoginOutPutModel(
      json['token'] as String,
      json['expires'] as String,
      json['refresh_token'] as String,
    );

Map<String, dynamic> _$LoginOutPutModelToJson(LoginOutPutModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
      'refresh_token': instance.refreshToken,
    };
