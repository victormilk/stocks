import 'dart:developer';

import 'package:stocks_core/core.dart';

class LogUtils {
  const LogUtils._();

  static void logException({Object? error, int level = 0}) {
    log('An exception occurred.', error: error, level: level);
  }

  static void logEmittingState({
    required BaseState fromState,
    required BaseState toState,
  }) {
    log('Emitting state: $fromState -> $toState');
  }

  static void logInitModule(String moduleName) {
    log('Initializing module: $moduleName');
  }

  static void logDisposeModule(String moduleName) {
    log('Disposing module: $moduleName');
  }
}
