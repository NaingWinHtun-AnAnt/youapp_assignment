import 'package:json_annotation/json_annotation.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';

part "get_profile_response.g.dart";

@JsonSerializable()
class GetProfileResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  ProfileVO? data;

  GetProfileResponse({
    this.message,
    this.data,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileResponseToJson(this);
}
