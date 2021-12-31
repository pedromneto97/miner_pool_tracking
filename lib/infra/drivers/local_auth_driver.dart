abstract class LocalAuthDriver {
  const LocalAuthDriver();

  Future<bool> get canUseBiometrics;

  Future<bool> authenticate();
}
