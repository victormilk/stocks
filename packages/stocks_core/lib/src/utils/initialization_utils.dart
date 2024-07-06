import 'package:stocks_core/core.dart';
import 'package:stocks_core/src/module/main_module.dart';

class InitializationUtils {
  const InitializationUtils._();

  static void configureDependencies({required MainModule mainModule}) {
    injector.addSingleton<MainModule>(mainModule);
  }
}
