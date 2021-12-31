import 'package:flutter/material.dart';

import 'presenter/app/app.dart';
import 'setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(const App());
}
