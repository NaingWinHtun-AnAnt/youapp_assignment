import 'package:json_annotation/json_annotation.dart';

part "update_profile_request.g.dart";

@JsonSerializable()
class UpdateProfileRequest {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "birthday")
  String? birthday;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "weight")
  int? weight;

  @JsonKey(name: "interests")
  List<String>? interests;

  UpdateProfileRequest({
    this.name,
    this.birthday,
    this.height,
    this.weight,
    this.interests,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
