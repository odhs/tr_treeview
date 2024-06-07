class APIUtils {
  static const String kApiBaseURL = 'fake-api.tractian.com';
  static const String kApiAccess = 'companies';

  static String getCompanies() => kApiAccess;
  static String getAssets(String id) => '$kApiAccess/$id/assets';
  static String getLocations(String id) => '$kApiAccess/$id/locations';
}
