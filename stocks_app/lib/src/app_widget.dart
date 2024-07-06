import 'package:flutter/material.dart';
import 'package:stocks_core/core.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: injector.get<MainModule>().router,
    );
  }
}
