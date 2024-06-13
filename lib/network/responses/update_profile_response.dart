import 'package:json_annotation/json_annotation.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';

part "update_profile_response.g.dart";

@JsonSerializable()
class UpdateProfileResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  ProfileVO? data;

  UpdateProfileResponse({
    this.message,
    this.data,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseToJson(this);
}
