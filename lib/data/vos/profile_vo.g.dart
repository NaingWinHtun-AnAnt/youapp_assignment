// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileVOAdapter extends TypeAdapter<ProfileVO> {
  @override
  final int typeId = 1;

  @override
  ProfileVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileVO(
      email: fields[0] as String?,
      username: fields[1] as String?,
      interests: (fields[2] as List?)?.cast<String>(),
      displayName: fields[3] as dynamic,
      gender: fields[4] as dynamic,
      birthday: fields[5] as dynamic,
      horoscope: fields[6] as dynamic,
      zodiac: fields[7] as dynamic,
      height: fields[8] as dynamic,
      weight: fields[9] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.interests)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.birthday)
      ..writeByte(6)
      ..write(obj.horoscope)
      ..writeByte(7)
      ..write(obj.zodiac)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileVO _$ProfileVOFromJson(Map<String, dynamic> json) => ProfileVO(
      email: json['email'] as String?,
      username: json['username'] as String?,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      displayName: json['displayName'],
      gender: json['gender'],
      birthday: json['birthday'],
      horoscope: json['horoscope'],
      zodiac: json['zodiac'],
      height: json['height'],
      weight: json['weight'],
    );

Map<String, dynamic> _$ProfileVOToJson(ProfileVO instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'interests': instance.interests,
      'displayName': instance.displayName,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'horoscope': instance.horoscope,
      'zodiac': instance.zodiac,
      'height': instance.height,
      'weight': instance.weight,
    };
