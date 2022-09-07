class EnvironmentConfig {
  static const MOVIE_DB_API_KEY =
      String.fromEnvironment('MOVIE_DB_API_KEY', defaultValue: '');
  static const MOVIE_DB_BASE_URL =
      String.fromEnvironment('MOVIE_DB_BASE_URL', defaultValue: '');
}
