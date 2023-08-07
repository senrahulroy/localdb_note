class AppAssets {
  AppAssets._();

  // static const   _jsonPath = "assets/json";
  // static const String  emptyJson = "$_base/empty.json";

  /// Comman path for json
  static String jsonPath(String fileName) {
    return "assets/json/$fileName";
  }

  /// comman path for image
  static String imagePath(String fileName) {
    return "assets/images/$fileName";
  }

  /// All json String delete.json
  static String get splashJson => jsonPath("splash.json");
  static String get emptyJson => jsonPath("empty.json");
  static String get deleteJson => jsonPath("delete.json");
}
