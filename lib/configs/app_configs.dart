enum AppEnvironment { DEV,STAGING, PROD }

// this class contains the urls and details that we want to pass in dev or in production
abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.PROD;
   /// The max allowed age duration for the http cache
  static const Duration maxCacheAge = Duration(hours: 1);
  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: ' Flutter TDD Dev',
    AppEnvironment.STAGING: 'Flutter TDD staging',
    AppEnvironment.PROD: ' Flutter TDD',
  };

  static const _connectionStrings = {
    AppEnvironment.DEV: 'put the url in dev',
    AppEnvironment.STAGING: 'put the url in local',
    /// DummyJson get dummy/fake json data to use as placeholder in developpement or in prototype testing
    AppEnvironment.PROD: 'https://dummyjson.com',
  };
  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.STAGING:'staging',
    AppEnvironment.PROD: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}