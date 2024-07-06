import 'package:flutter/cupertino.dart';
import 'package:stocks_app/src/app_module.dart';
import 'package:stocks_app/src/app_widget.dart';
import 'package:stocks_core/core.dart';

Future<void> main() async {
  InitializationUtils.configureDependencies(mainModule: AppModule());
  runApp(const AppWidget());
}
