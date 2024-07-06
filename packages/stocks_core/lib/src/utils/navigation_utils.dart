import 'package:flutter/cupertino.dart';
import 'package:stocks_core/core.dart';

extension NavigationUtils on BuildContext {
  void goToHome() => goNamed(RouteUtils.homeName);
}
