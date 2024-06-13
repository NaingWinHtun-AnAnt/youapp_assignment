import 'package:flutter_test/flutter_test.dart';
import 'package:youapp_assignment/blocs/home_bloc.dart';

import '../data/models/user_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Home Bloc Test", () {
    HomeBloc? homeBloc;

    setUp(() {
      homeBloc = HomeBloc(userModel: UserModelImplMock());
    });

    /// get Profile Test
    test("Profile Object Test", () {
      expect(
        homeBloc?.mProfile,
        getMockProfile(),
      );
    });
  });
}
