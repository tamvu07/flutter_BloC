// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginInPutModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInPutModel _$LoginInPutModelFromJson(Map<String, dynamic> json) =>
    LoginInPutModel(
      json['username'] as String,
      json['password'] as String,
      (json['device_type'] as num).toInt(),
      json['device_token'] as String?,
    );

Map<String, dynamic> _$LoginInPutModelToJson(LoginInPutModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'device_type': instance.deviceType,
      'device_token': instance.deviceToken,
    };
