import 'dart:io';
import 'package:yaml/yaml.dart';



String generateAppName({
  required String flavor,
  required String buildType,
}) {
  // Function to get 'name' and 'version' from pubspec.yaml
  Map<String, String> getPubspecNameAndVersion() {
    final pubspecFile = File('pubspec.yaml');

    // Check if the pubspec.yaml file exists
    if (pubspecFile.existsSync()) {
      // Read the content of the pubspec.yaml file
      String content = pubspecFile.readAsStringSync();

      // Parse the YAML content
      var yamlMap = loadYaml(content);

      // Extract 'name' and 'version' fields
      String name = yamlMap['name'];
      String version = yamlMap['version'];

      // Return the name and version as a map
      return {'name': name, 'version': version};
    } else {
      throw Exception('pubspec.yaml not found in the current directory.');
    }
  }

  // Get app name and version from pubspec.yaml
  var pubspecInfo = getPubspecNameAndVersion();
  String appName = pubspecInfo['name'] ?? 'unknown';
  String versionName = pubspecInfo['version'] ?? '1.0.0';

  // Get current timestamp in the format DyyyyMMddThhmmss
  DateTime timestamp = DateTime.now();
  String formattedTimestamp = 'D${timestamp.year.toString().padLeft(4, '0')}${timestamp.month.toString().padLeft(2, '0')}${timestamp.day.toString().padLeft(2, '0')}T${timestamp.hour.toString().padLeft(2, '0')}${timestamp.minute.toString().padLeft(2, '0')}${timestamp.second.toString().padLeft(2, '0')}';

  // Construct the APK name
  String fileName = '$appName-$flavor-$versionName-$buildType-$formattedTimestamp';


  return fileName;
}
