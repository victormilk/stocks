import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:stocks_core/core.dart';

abstract class BaseModule {
  String get mainPath;

  String get mainName;

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) => null;

  Widget builder(BuildContext context, GoRouterState state);

  List<RouteBase> get subRoutes => [];

  void binds(Injector i) {}

  void unbinds(Injector i) {}

  GoRoute get route => GoRoute(
        redirect: redirect,
        path: mainPath,
        name: mainName,
        builder: (context, state) {
          LogUtils.logInitModule(runtimeType.toString());
          binds(injector);
          return builder(context, state);
        },
        onExit: (context, state) {
          LogUtils.logDisposeModule(runtimeType.toString());
          unbinds(injector);
          return true;
        },
        routes: subRoutes,
      );
}
