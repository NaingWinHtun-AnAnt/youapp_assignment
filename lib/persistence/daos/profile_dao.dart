import 'package:youapp_assignment/data/vos/profile_vo.dart';

abstract class ProfileDao {
  /// save
  void saveProfile(ProfileVO? profile);

  /// get
  ProfileVO? getProfile();

  /// reactive programming
  Stream<void> getProfileEventStream();

  Stream<ProfileVO?> getProfileStream();

  void clearBox();
}
