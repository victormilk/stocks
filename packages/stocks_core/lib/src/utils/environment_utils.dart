class EnvironmentUtils {
  const EnvironmentUtils._();

  static const bool enabledLogs =
      bool.fromEnvironment('ENABLED_LOGS', defaultValue: true);
}
