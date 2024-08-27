// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detectionsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetectionsModel _$DetectionsModelFromJson(Map<String, dynamic> json) =>
    DetectionsModel(
      detectionsModel: (json['detection'] as List<dynamic>)
          .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetectionsModelToJson(DetectionsModel instance) =>
    <String, dynamic>{
      'detection': instance.detectionsModel,
    };
