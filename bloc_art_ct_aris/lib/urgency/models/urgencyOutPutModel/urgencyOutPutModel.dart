// // ignore_for_file: public_member_api_docs, sort_constructors_first


// import 'package:freezed_annotation/freezed_annotation.dart';

// @JsonSerializable()
// class UrgencyOutPutModel {

//   @JsonKey(name: 'setting')
//   DetectionsModel setting;

//   UrgencyOutPut({required this.setting});

//   factory UrgencyOutPut.fromJson(Map<String, dynamic> json) => _$UrgencyOutPutFromJson(json);
//   Map<String, dynamic> toJson() => _$UrgencyOutPutToJson(this);
// }


import 'package:bloc_art_ct_aris/urgency/models/detectionsModel/detectionsModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'urgencyOutPutModel.g.dart';

@JsonSerializable()
class UrgencyOutPutModel {

  @JsonKey(name: 'setting')
   DetectionsModel setting;

  UrgencyOutPutModel({required this.setting});

  factory UrgencyOutPutModel.fromJson(Map<String, dynamic> json) => _$UrgencyOutPutModelFromJson(json);
  Map<String, dynamic> toJson() => _$UrgencyOutPutModelToJson(this);
}

