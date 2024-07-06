import 'package:stocks_app/src/home/home_module.dart';
import 'package:stocks_core/core.dart';

class AppModule extends MainModule {
  @override
  String get initialLocation => RouteUtils.homePath;

  @override
  List<BaseModule> get modules => [
        HomeModule(),
      ];
}
