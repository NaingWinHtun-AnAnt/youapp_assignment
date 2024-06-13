abstract class AuthModel {
  Future<String?>? register({
    required String? email,
    required String? userName,
    required String? password,
  });

  Future<String?>? login({
    required String? userName,
    required String? password,
  });
}
