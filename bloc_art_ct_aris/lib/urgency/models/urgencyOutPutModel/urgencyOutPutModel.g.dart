// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urgencyOutPutModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrgencyOutPutModel _$UrgencyOutPutModelFromJson(Map<String, dynamic> json) =>
    UrgencyOutPutModel(
      setting:
          DetectionsModel.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UrgencyOutPutModelToJson(UrgencyOutPutModel instance) =>
    <String, dynamic>{
      'setting': instance.setting,
    };
