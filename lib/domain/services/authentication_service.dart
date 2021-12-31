abstract class AuthenticationService {
  const AuthenticationService();

  Future<bool> authenticate();

  bool get isAuthenticated;
}
