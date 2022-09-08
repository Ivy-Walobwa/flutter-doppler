class EnvironmentConfig {
  static const AUTHORS_DB_BASE_URL =
      String.fromEnvironment('AUTHORS_DB_BASE_URL', defaultValue: '');
}
