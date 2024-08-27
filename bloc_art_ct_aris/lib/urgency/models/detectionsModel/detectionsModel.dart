

import 'package:bloc_art_ct_aris/urgency/models/serviceModel/serviceModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detectionsModel.g.dart';

@JsonSerializable()
class DetectionsModel {

@JsonKey(name: 'detection')
List<ServiceModel> detectionsModel;
  DetectionsModel({required this.detectionsModel});

  factory DetectionsModel.fromJson(Map<String, dynamic> json) => _$DetectionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetectionsModelToJson(this);
}

