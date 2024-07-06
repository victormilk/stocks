import 'package:get_it/get_it.dart';

final Injector injector = _GetItInjector();

abstract class Injector {
  T get<T extends Object>({String? name});

  void addFactory<T extends Object>(T Function() factory, {String? name});

  void addSingleton<T extends Object>(T instance, {String? name});

  void addLazySingleton<T extends Object>(T Function() factory, {String? name});

  void unregister<T extends Object>({String? name});
}

class _GetItInjector extends Injector {
  @override
  void addFactory<T extends Object>(T Function() factory, {String? name}) {
    _replace(factory, name: name);
  }

  @override
  void addLazySingleton<T extends Object>(
    T Function() factory, {
    String? name,
  }) {
    _replace(factory, name: name);
  }

  @override
  void addSingleton<T extends Object>(T instance, {String? name}) {
    _replace(() => instance, name: name);
  }

  @override
  T get<T extends Object>({String? name}) {
    return GetIt.I.get<T>(instanceName: name);
  }

  @override
  void unregister<T extends Object>({String? name}) {
    if (GetIt.I.isRegistered<T>(instanceName: name)) {
      GetIt.I.unregister<T>(instanceName: name);
    }
  }

  void _replace<T extends Object>(
    T Function() factory, {
    String? name,
    bool isSingleton = false,
    bool isLazy = false,
  }) {
    if (GetIt.I.isRegistered<T>(instanceName: name)) {
      GetIt.I.unregister<T>(instanceName: name);
    }
    if (isSingleton) {
      GetIt.I.registerSingleton<T>(factory(), instanceName: name);
    } else if (isLazy) {
      GetIt.I.registerLazySingleton<T>(factory, instanceName: name);
    } else {
      GetIt.I.registerFactory<T>(factory, instanceName: name);
    }
  }
}
