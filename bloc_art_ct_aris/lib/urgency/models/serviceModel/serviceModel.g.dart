// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      active: json['active'] as bool? ?? false,
      name: json['name'] as String,
      alert: json['alert'] as bool? ?? false,
      calling: json['calling'] as bool? ?? false,
      expireAt: (json['expireAt'] as num).toInt(),
      notification: json['noti'] as bool? ?? false,
      sms: json['sms'] as bool? ?? false,
      startAt: (json['startAt'] as num).toInt(),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'alert': instance.alert,
      'calling': instance.calling,
      'sms': instance.sms,
      'noti': instance.notification,
      'startAt': instance.startAt,
      'expireAt': instance.expireAt,
    };
