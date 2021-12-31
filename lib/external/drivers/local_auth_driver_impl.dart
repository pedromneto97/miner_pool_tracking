import 'package:local_auth/local_auth.dart';

import '../../infra/infra.dart';

class LocalAuthDriverImplementation extends LocalAuthDriver {
  final _localAuth = LocalAuthentication();

  @override
  Future<bool> authenticate() async => _localAuth.authenticate(
        localizedReason: 'Authentication required to access your wallets',
      );

  @override
  Future<bool> get canUseBiometrics => _localAuth.canCheckBiometrics;
}
