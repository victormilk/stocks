import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:stocks_core/src/utils/environment_utils.dart';
import 'package:stocks_core/src/utils/log_utils.dart';

abstract class BaseState with EquatableMixin {
  const BaseState();
}

abstract class BaseStore<S extends BaseState> implements ValueListenable<S> {
  S get initialState;

  late final ValueNotifier<S> _stateNotifier = ValueNotifier(initialState);

  @override
  S get value => _stateNotifier.value;

  S get state => _stateNotifier.value;

  @protected
  void emit(S newState) {
    if (EnvironmentUtils.enabledLogs) {
      LogUtils.logEmittingState(fromState: state, toState: newState);
    }
    _stateNotifier.value = newState;
  }

  @override
  void addListener(VoidCallback listener) {
    _stateNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateNotifier.removeListener(listener);
  }

  void dispose() {
    _stateNotifier.dispose();
  }
}
