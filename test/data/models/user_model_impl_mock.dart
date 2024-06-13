import 'package:youapp_assignment/data/models/user_model.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';

import '../../mock_data/mock_data.dart';

class UserModelImplMock extends UserModel {
  @override
  void getProfile() {
    /// no need to add implement, cause we don't test retrofit
  }

  @override
  Stream<ProfileVO?> getProfileFromDatabase() => Stream.value(getMockProfile());

  @override
  void updateProfile(
      {required String token,
      required String? birthday,
      required List<String> interests,
      required String? name,
      required int? height,
      required int? weight}) {
    /// no need to add implement, cause we don't test retrofit
  }

  @override
  void updateProfileToDatabase(
      {required String? birthday,
      required List<String> interests,
      required String? displayName,
      required String? height,
      required String? weight,
      required String? gender,
      required String? zodiac,
      required String? horoscope,
      required String? profilePhoto}) {
    }
}
