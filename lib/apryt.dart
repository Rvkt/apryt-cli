// import 'dart:io';
// import 'package:yaml/yaml.dart';
//
// String generateAppName({required String flavor, required String buildType}) {
//   // Function to get 'name' and 'version' from pubspec.yaml
//   Map<String, String> getPubspecNameAndVersion() {
//     final pubspecFile = File('pubspec.yaml');
//
//     // Check if the pubspec.yaml file exists
//     if (pubspecFile.existsSync()) {
//       // Read the content of the pubspec.yaml file
//       String content = pubspecFile.readAsStringSync();
//
//       // Parse the YAML content
//       var yamlMap = loadYaml(content);
//
//       // Extract 'name' and 'version' fields
//       String name = yamlMap['name'];
//       String version = yamlMap['version'];
//
//       // Return the name and version as a map
//       return {'name': name, 'version': version};
//     } else {
//       throw Exception('pubspec.yaml not found in the current directory.');
//     }
//   }
//
//   // Get app name and version from pubspec.yaml
//   var pubspecInfo = getPubspecNameAndVersion();
//   String appName = pubspecInfo['name'] ?? 'unknown';
//   String versionName = pubspecInfo['version'] ?? '1.0.0';
//
//   // Get current timestamp in the format DyyyyMMddThhmmss
//   DateTime timestamp = DateTime.now();
//   String formattedTimestamp =
//       'D${timestamp.year.toString().padLeft(4, '0')}${timestamp.month.toString().padLeft(2, '0')}${timestamp.day.toString().padLeft(2, '0')}T${timestamp.hour.toString().padLeft(2, '0')}${timestamp.minute.toString().padLeft(2, '0')}${timestamp.second.toString().padLeft(2, '0')}';
//
//   // Construct the APK name
//   String fileName = '${appName.toUpperCase()}-${flavor.toUpperCase()}-$versionName-${buildType.toUpperCase()}-$formattedTimestamp';
//
//   copyToClipboard(fileName);
//
//   return fileName;
// }
//
// void copyToClipboard(String text) {
//   try {
//     if (Platform.isWindows) {
//       // Works for both CMD and PowerShell
//       Process.runSync("cmd", ["/c", "echo $text | clip"]);
//     } else if (Platform.isMacOS) {
//       // Works for bash, zsh, and any macOS shell
//       Process.runSync("pbcopy", [], runInShell: true, stdin: text);
//     } else if (Platform.isLinux) {
//       // Linux: Uses xclip or xsel
//       Process.runSync("bash", ["-c", "echo \"$text\" | xclip -selection clipboard || echo \"$text\" | xsel --clipboard"]);
//     }
//     print('📋 APK name copied to clipboard!');
//   } catch (e) {
//     print('❌ Failed to copy to clipboard: $e');
//   }
// }
//
// void init() {
//   // Show process start message
//   print('🛠️ Setting up project structure...');
//
//   // Create assets and lib folders
//   _createAssetsFolders();
//   _createCoreFiles();
//   _createNetworkFiles();
//   _createCommonWidgets();
//
//   // Show process end message
//   print('🎉 Folder setup completed successfully!');
// }
//
// void _createAssetsFolders() {
//   const assetsFolder = 'assets';
//   final assetsDirectory = Directory(assetsFolder);
//
//   if (!assetsDirectory.existsSync()) {
//     assetsDirectory.createSync(recursive: true);
//   }
//
//   List<String> assetsSubfolders = ['images', 'logo', 'animation', 'icons', 'localization'];
//   for (var subfolder in assetsSubfolders) {
//     final subDirectory = Directory('$assetsFolder/$subfolder');
//     if (!subDirectory.existsSync()) {
//       subDirectory.createSync(recursive: true);
//     }
//   }
// }
//
// void _createCoreFiles() {
//   const coreFolder = 'lib/core';
//
//   Map<String, String> coreFiles = {
//     'constants/app_constant.dart': '''
// // This file will contain application-wide constants.
// ''',
//     'services/api_service.dart': '''
// // This file will handle API-related services.
// ''',
//     'themes/app_themes.dart': '''
// // This file will define the application's themes.
// ''',
//     'themes/text_styles.dart': '''
// // This file will define text styles used throughout the app.
// ''',
//     'utils/validators.dart': '''
// // This file will contain input validators.
// ''',
//     'utils/data_utils.dart': '''
// // This file will contain utility functions for data processing.
// ''',
//     'utils/logger.dart': '''
// // This file will handle logging functionalities.
// ''',
//     'utils/extensions.dart': '''
// // This file will define useful extensions for Dart/Flutter.
// ''',
//     'utils/globals.dart': '''
// // This file will define global variables and configurations.
// ''',
//     'navigation/app_routes.dart': '''
// // This file will define application navigation routes.
// '''
//   };
//
//   coreFiles.forEach((relativePath, content) {
//     final file = File('$coreFolder/$relativePath');
//     final directory = file.parent;
//     if (!directory.existsSync()) {
//       directory.createSync(recursive: true);
//     }
//     if (!file.existsSync()) {
//       file.writeAsStringSync(content);
//     }
//   });
// }
//
// void _createNetworkFiles() {
//   const networkFolder = 'lib/data/network';
//   final networkDirectory = Directory(networkFolder);
//
//   if (!networkDirectory.existsSync()) {
//     networkDirectory.createSync(recursive: true);
//   }
//
//   Map<String, String> networkFiles = {
//     'api_client.dart': '''
// // This file will contain the API client implementation.
// ''',
//     'api_endpoint.dart': '''
// // This file will define API endpoint constants.
// ''',
//     'api_url.dart': '''
// // This file will store the base API URL.
// ''',
//     'api_headers.dart': '''
// // This file will define API request headers.
// ''',
//     'api_requests.dart': '''
// // This file will handle API request models and parameters.
// ''',
//     'network_exception.dart': '''
// // This file will handle network-related exceptions.
// ''',
//     'api_status.dart': '''
// // This file defines API status codes.
//
// const int failed = 0x0;
// const int success = 0x1;
// '''
//   };
//
//   networkFiles.forEach((fileName, content) {
//     final file = File('$networkFolder/$fileName');
//     if (!file.existsSync()) {
//       file.writeAsStringSync(content);
//     }
//   });
// }
//
// void _createCommonWidgets() {
//   const commonWidgetsFolder = 'lib/widgets/common';
//   final commonWidgetsDirectory = Directory(commonWidgetsFolder);
//
//   if (!commonWidgetsDirectory.existsSync()) {
//     commonWidgetsDirectory.createSync(recursive: true);
//   }
//
//   Map<String, String> commonWidgetFiles = {
//     'loading_indicator.dart': '''
// // This file will contain the LoadingIndicator widget.
// ''',
//     'custom_button.dart': '''
// // This file will contain the CustomButton widget.
// ''',
//     'custom_text.dart': '''
// // This file will contain the CustomText widget.
// '''
//   };
//
//   commonWidgetFiles.forEach((fileName, content) {
//     final file = File('$commonWidgetsFolder/$fileName');
//     if (!file.existsSync()) {
//       file.writeAsStringSync(content);
//     }
//   });
// }
//
// void createFeature({required String featureName}) {
//   if (featureName.trim().isEmpty) {
//     print('❌ Error: Feature name cannot be empty.');
//     return;
//   }
//
//   var featureFolder = 'lib/feature/$featureName';
//
//   Map<String, String> featureFiles = {
//     'model/${featureName}_model.dart': '''
// // This file defines the data model for the $featureName feature.
// ''',
//     'provider/${featureName}_provider.dart': '''
// // This file contains the state management logic for the $featureName feature.
// ''',
//     'widgets/${featureName}_widget.dart': '''
// // This file contains reusable UI components for the $featureName feature.
// ''',
//     'screen/${featureName}_screen.dart': '''
// // This file contains the main UI screen for the $featureName feature.
// ''',
//     '${featureName}_imports.dart': '''
// // This file will handle all necessary imports for the $featureName feature.
// '''
//   };
//
//   try {
//     featureFiles.forEach((relativePath, content) {
//       final file = File('$featureFolder/$relativePath');
//       final directory = file.parent;
//
//       if (!directory.existsSync()) {
//         directory.createSync(recursive: true);
//         // print('📁 Created directory: ${directory.path}');
//       }
//
//       if (!file.existsSync()) {
//         file.writeAsStringSync(content);
//         // print('✅ Created file: ${file.path}');
//       } else {
//         print('⚠️ File already exists: ${file.path}');
//       }
//     });
//
//     print('🎉 Feature "$featureName" added successfully!');
//   } catch (e) {
//     print('❌ Error creating feature: $e');
//   }
// }
//


import 'dart:io';
import 'package:yaml/yaml.dart';

/// Generates an app name based on the project name, flavor, and build type.
String generateAppName({required String flavor, required String buildType}) {
  final pubspecInfo = _getPubspecInfo();
  final appName = pubspecInfo['name'] ?? 'unknown';
  final versionName = pubspecInfo['version'] ?? '1.0.0';

  final formattedTimestamp = _getFormattedTimestamp();
  final fileName =
      '${appName.toUpperCase()}-${flavor.toUpperCase()}-$versionName-${buildType.toUpperCase()}-$formattedTimestamp';

  _copyToClipboard(fileName);
  return fileName;
}

/// Reads `name` and `version` from `pubspec.yaml`.
Map<String, String> _getPubspecInfo() {
  final pubspecFile = File('pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    throw Exception('❌ pubspec.yaml not found in the current directory.');
  }

  final yamlMap = loadYaml(pubspecFile.readAsStringSync());
  return {
    'name': yamlMap['name'] ?? 'unknown',
    'version': yamlMap['version'] ?? '1.0.0',
  };
}

/// Returns a timestamp formatted as `DyyyyMMddThhmmss`.
String _getFormattedTimestamp() {
  final now = DateTime.now();
  return 'D${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}T'
      '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
}

/// Copies a string to the clipboard.
void _copyToClipboard(String text) {
  try {
    if (Platform.isWindows) {
      // Windows: Uses clip command
      Process.runSync("cmd", ["/c", 'echo|set /p=$text | clip']);
    } else if (Platform.isMacOS) {
      // macOS: Uses pbcopy
      var process = Process.start("pbcopy", []);
      process.then((p) {
        p.stdin.writeln(text);
        p.stdin.close();
      });
    } else if (Platform.isLinux) {
      // Linux: Uses xclip or xsel
      Process.runSync("bash", ["-c", "echo \"$text\" | xclip -selection clipboard || echo \"$text\" | xsel --clipboard"]);
    }
    // print('📋 APK name copied to clipboard!');
  } catch (e) {
    print('❌ Failed to copy to clipboard: $e');
  }
}


/// Initializes the project structure.
void init() {
  print('🛠️ Setting up project structure...');
  _createAssetsFolders();
  _createCoreFiles();
  _createNetworkFiles();
  _createCommonWidgets();
  print('🎉 Folder setup completed successfully!');
}

/// Creates the assets folder and subdirectories.
void _createAssetsFolders() {
  const assetsFolder = 'assets';
  final subfolders = ['images', 'logo', 'animation', 'icons', 'localization'];

  _createDirectories([assetsFolder, ...subfolders.map((s) => '$assetsFolder/$s')]);
}

/// Creates core files in `lib/core/`.
void _createCoreFiles() {
  const coreFolder = 'lib/core';

  final coreFiles = {
    'constants/app_constant.dart': '// App-wide constants',
    'services/api_service.dart': '// API services',
    'themes/app_themes.dart': '// App themes',
    'themes/text_styles.dart': '// Text styles',
    'utils/validators.dart': '// Input validators',
    'utils/data_utils.dart': '// Utility functions',
    'utils/logger.dart': '// Logging utilities',
    'utils/extensions.dart': '// Dart/Flutter extensions',
    'utils/globals.dart': '// Global configurations',
    'navigation/app_routes.dart': '// Navigation routes',
  };

  _createFiles(coreFolder, coreFiles);
}

/// Creates network-related files in `lib/data/network/`.
void _createNetworkFiles() {
  const networkFolder = 'lib/data/network';

  final networkFiles = {
    'api_client.dart': '// API client implementation',
    'api_endpoint.dart': '// API endpoint constants',
    'api_url.dart': '// Base API URL',
    'api_headers.dart': '// API request headers',
    'api_requests.dart': '// API request models',
    'network_exception.dart': '// Network-related exceptions',
    'api_status.dart': 'const int failed = 0x0;\nconst int success = 0x1;',
  };

  _createFiles(networkFolder, networkFiles);
}

/// Creates common reusable widgets.
void _createCommonWidgets() {
  const commonWidgetsFolder = 'lib/widgets/common';

  final commonWidgetFiles = {
    'loading_indicator.dart': '// Loading indicator widget',
    'custom_button.dart': '// Custom button widget',
    'custom_text.dart': '// Custom text widget',
  };

  _createFiles(commonWidgetsFolder, commonWidgetFiles);
}

/// Creates a new feature folder structure.
void createFeature({required String featureName}) {
  if (featureName.trim().isEmpty) {
    print('❌ Feature name cannot be empty.');
    return;
  }

  final featureFolder = 'lib/feature/$featureName';

  final featureFiles = {
    'model/${featureName}_model.dart': '// $featureName data model',
    'provider/${featureName}_provider.dart': '// $featureName state management',
    'widgets/${featureName}_widget.dart': '// UI components for $featureName',
    'screen/${featureName}_screen.dart': '// UI screen for $featureName',
    '${featureName}_imports.dart': '// All necessary imports for $featureName',
  };

  _createFiles(featureFolder, featureFiles);
  print('🎉 Feature "$featureName" added successfully!');
}

/// Creates directories recursively.
void _createDirectories(List<String> directories) {
  for (var dirPath in directories) {
    final directory = Directory(dirPath);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      // print('📁 Created: $dirPath');
    }
  }
}

/// Creates multiple files under a given directory.
void _createFiles(String basePath, Map<String, String> files) {
  for (var entry in files.entries) {
    final filePath = '$basePath/${entry.key}';
    final file = File(filePath);

    if (!file.existsSync()) {
      file.createSync(recursive: true);
      file.writeAsStringSync(entry.value);
      // print('✅ Created: $filePath');
    } else {
      print('⚠️ Already exists: $filePath');
    }
  }
}
