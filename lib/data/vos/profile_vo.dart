import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:youapp_assignment/persistence/hive_constants.dart';

part "profile_vo.g.dart";

@JsonSerializable()
@HiveType(typeId: hiveTypeIdProfileVO, adapterName: "ProfileVOAdapter")
class ProfileVO {
  @JsonKey(name: "email")
  @HiveField(0)
  String? email;

  @JsonKey(name: "username")
  @HiveField(1)
  String? username;

  @JsonKey(name: "interests")
  @HiveField(2)
  List<String>? interests;

  @HiveField(3)
  String? displayName;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? birthday;

  @HiveField(6)
  String? horoscope;

  @HiveField(7)
  String? zodiac;

  @HiveField(8)
  String? height;

  @HiveField(9)
  String? weight;

  @HiveField(10)
  String? profilePhoto;

  ProfileVO({
    this.email,
    this.username,
    this.interests,
    this.displayName,
    this.gender,
    this.birthday,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
    this.profilePhoto,
  });

  factory ProfileVO.fromJson(Map<String, dynamic> json) =>
      _$ProfileVOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileVO &&
          runtimeType == other.runtimeType &&
          username == other.username;

  @override
  int get hashCode => username.hashCode;

  @override
  String toString() {
    return 'ProfileVO{horoscope: $horoscope}';
  }
}
