import 'package:flutter_test/flutter_test.dart';
import 'package:youapp_assignment/data/models/user_model_impl.dart';

import '../../mock_data/mock_data.dart';
import '../../network/data_agent_impl_mock.dart';
import '../../persistence/profile_dao_impl_mock.dart';

void main() {
  group("profile_data_test", () {
    var userModel = UserModelImpl();
    var userModel1 = UserModelImpl();

    /// set up
    /// this function will invoke before a single test run
    setUp(() {
      userModel.setDaosAndDataAgent(
        dataAgent: DataAgentImplMock(),
        profileDao: ProfileDaoImplMock(),
      );
    });

    /// singleton test for model object
    test("Singleton Test", () {
      expect(userModel, userModel1);
    });

    /// test get profile from database
    /// expect value must be the same with actual value return type
    test("Retrieve Profile to database", () {
      expect(
        userModel.getProfileFromDatabase(),
        emits(
          getMockProfile(),
        ),
      );
    });
  });
}
