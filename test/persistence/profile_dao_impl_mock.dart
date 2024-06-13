import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/persistence/daos/profile_dao.dart';

import '../mock_data/mock_data.dart';

class ProfileDaoImplMock extends ProfileDao {
  Map<int, ProfileVO> profileFromDatabaseMock = {};

  @override
  void saveProfile(ProfileVO? profile) {
    if (profile != null) {
      profileFromDatabaseMock[1] = profile;
    }
  }

  @override
  Stream<void> getProfileEventStream() => Stream.value(null);

  @override
  Stream<ProfileVO?> getProfileStream() => Stream.value(getProfile());

  @override
  ProfileVO? getProfile() => getMockProfile();

  @override
  void clearBox() {}
}
