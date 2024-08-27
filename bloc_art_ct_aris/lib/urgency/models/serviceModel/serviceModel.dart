
import 'package:json_annotation/json_annotation.dart';

part 'serviceModel.g.dart';

@JsonSerializable()
class ServiceModel {

  String name;
  @JsonKey(defaultValue: false)
  bool active;
  @JsonKey(defaultValue: false)
  bool alert;
  @JsonKey(defaultValue: false)
  bool calling;
  @JsonKey(defaultValue: false)
  bool sms;
  @JsonKey(defaultValue: false, name: 'noti')
  bool notification;
  int startAt;
  int expireAt;

  ServiceModel(
      {required this.active,
      required this.name,
      required this.alert,
      required this.calling,
      required this.expireAt,
      required this.notification,
      required this.sms,
      required this.startAt});

  ServiceModel clone() {
    return ServiceModel(
        active: active,
        name: name,
        alert: alert,
        calling: calling,
        expireAt: expireAt,
        notification: notification,
        sms: sms,
        startAt: startAt);
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);

  
}


