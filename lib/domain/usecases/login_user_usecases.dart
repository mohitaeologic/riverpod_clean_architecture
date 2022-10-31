

import '../../data/repositories/auth_repo.dart';

class LoginUser {
  AuthenticationImpl authenticationImpl = AuthenticationImpl();
  Future execute({required String username,required String password,required String clientCode}) {
    return authenticationImpl.login(username: username, password: password, clientCode: clientCode);
  }
}
