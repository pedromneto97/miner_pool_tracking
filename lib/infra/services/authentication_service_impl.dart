import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../drivers/drivers.dart';

class AuthenticationServiceImplementation extends AuthenticationService {
  bool _authenticated = false;

  @override
  Future<bool> authenticate() async {
    final hasAuthentication = GetIt.I<SettingsService>().settings.enableBiometry;
    if (!hasAuthentication) {
      _authenticated = true;
      return true;
    }

    return GetIt.I<LocalAuthDriver>().authenticate().then((value) {
      return _authenticated = value;
    });
  }

  @override
  bool get isAuthenticated => _authenticated;
}
