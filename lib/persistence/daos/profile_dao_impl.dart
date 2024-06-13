import 'package:hive_flutter/hive_flutter.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/persistence/daos/profile_dao.dart';
import 'package:youapp_assignment/persistence/hive_constants.dart';

class ProfileDaoImpl extends ProfileDao {
  static final ProfileDaoImpl _singleton = ProfileDaoImpl._internal();

  factory ProfileDaoImpl() => _singleton;

  ProfileDaoImpl._internal();

  /// save
  @override
  void saveProfile(ProfileVO? profile) async {
    if (profile != null) {
      await getProfileBox().put(keyProfileVO, profile);
    }
  }

  /// get
  @override
  ProfileVO? getProfile() => getProfileBox().get(keyProfileVO);

  /// reactive programming
  @override
  Stream<void> getProfileEventStream() => getProfileBox().watch();

  @override
  Stream<ProfileVO?> getProfileStream() => Stream.value(getProfile());

  /// clear box
  @override
  void clearBox() async {
    await getProfileBox().deleteAll(getProfileBox().keys);
    await getProfileBox().clear();
  }

  Box<ProfileVO> getProfileBox() => Hive.box(boxNameProfileVO);
}
