import 'package:flutter/widgets.dart';
import 'package:stocks_app/src/home/presentation/pages/home_page.dart';
import 'package:stocks_core/core.dart';

class HomeModule extends BaseModule {
  @override
  String get mainName => RouteUtils.homeName;

  @override
  String get mainPath => RouteUtils.homePath;

  @override
  Widget builder(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
