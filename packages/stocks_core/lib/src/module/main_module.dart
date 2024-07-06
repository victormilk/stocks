import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:stocks_core/src/module/base_module.dart';
import 'package:stocks_core/src/utils/environment_utils.dart';

abstract class MainModule {
  String get initialLocation;

  Listenable? get refreshListenable => null;

  FutureOr<String?> Function(BuildContext, GoRouterState)? get redirect => null;

  List<BaseModule> get modules => [];

  GoRouter get router => GoRouter(
        redirect: redirect,
        refreshListenable: refreshListenable,
        initialLocation: initialLocation,
        debugLogDiagnostics: EnvironmentUtils.enabledLogs,
        routes: modules.map((m) => m.route).toList(),
      );
}
