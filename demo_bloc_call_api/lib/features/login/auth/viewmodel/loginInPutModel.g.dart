// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginInPutModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInPutModel _$LoginInPutModelFromJson(Map<String, dynamic> json) =>
    LoginInPutModel(
      username: json['username'] as String,
      password: json['password'] as String,
      deviceToken: json['device_token'] as String?,
      deviceType: json['device_type'] as int,
    );

Map<String, dynamic> _$LoginInPutModelToJson(LoginInPutModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'device_type': instance.deviceType,
      'device_token': instance.deviceToken,
    };
