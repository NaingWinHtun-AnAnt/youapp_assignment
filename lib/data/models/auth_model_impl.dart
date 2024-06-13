import 'package:youapp_assignment/data/models/auth_model.dart';
import 'package:youapp_assignment/network/dataagents/data_agent.dart';
import 'package:youapp_assignment/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:youapp_assignment/network/requests/login_request.dart';
import 'package:youapp_assignment/network/requests/register_request.dart';

class AuthModelImpl extends AuthModel {
  static final AuthModelImpl _singleton = AuthModelImpl._internal();

  AuthModelImpl._internal();

  factory AuthModelImpl() {
    return _singleton;
  }

  /// data agent
  final DataAgent _mDataAgent = RetrofitDataAgentImpl();

  @override
  Future<String?>? login(
          {required String? userName, required String? password}) =>
      _mDataAgent.login(
          loginRequest: LoginRequest(
        email: "",
        username: userName,
        password: password,
      ));

  @override
  Future<String?>? register(
          {required String? email,
          required String? userName,
          required String? password}) =>
      _mDataAgent.register(
        registerRequest: RegisterRequest(
          email: email,
          username: userName,
          password: password,
        ),
      );
}
