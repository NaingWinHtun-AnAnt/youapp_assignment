import 'package:youapp_assignment/data/vos/profile_vo.dart';

abstract class UserModel {
  void getProfile();

  void updateProfile({
    required String token,
    required String? birthday,
    required List<String> interests,
    required String? name,
    required int? height,
    required int? weight,
  });

  /// from database
  Stream<ProfileVO?> getProfileFromDatabase();

  /// no need if API IS OK
  void updateProfileToDatabase({
    required String? birthday,
    required List<String> interests,
    required String? displayName,
    required String? height,
    required String? weight,
    required String? gender,
    required String? zodiac,
    required String? horoscope,
    required String? profilePhoto,
  });
}
