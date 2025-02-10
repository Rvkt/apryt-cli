import 'package:apryt/apryt.dart' as apryt;

// void main(List<String> arguments) {
//   if (arguments.isEmpty) {
//     print('''
// Usage: apryt <command>
// Commands:
//   init - Creates project folders
//   generate <flavor> <build_type> - Generates APK name
//   add feat <feature_name> - Adds a new feature folder in lib/feature
// ''');
//     return;
//   }
//
//   switch (arguments[0]) {
//     case 'init':
//       try {
//         apryt.init();
//         // print('✅ Initialized successfully.');
//       } catch (e) {
//         print('❌ Error initializing: $e');
//       }
//       break;
//
//     case 'generate':
//       if (arguments.length < 3) {
//         print('Usage: apryt generate <flavor> <build_type>');
//         return;
//       }
//
//       String flavor = arguments[1];
//       String buildType = arguments[2];
//
//       try {
//         String apkName = apryt.generateAppName(
//           flavor: flavor,
//           buildType: buildType,
//         );
//         print('📝 Generated File Name: $apkName');
//
//
//       } catch (e) {
//         print('❌ Error generating APK name: $e');
//       }
//       break;
//
//     case 'add':
//       if (arguments.length < 3 || arguments[1] != 'feat') {
//         print('Usage: apryt add feat <feature_name>');
//         return;
//       }
//
//       String featureName = arguments[2];
//       try {
//         apryt.createFeature(featureName: featureName);
//         // print('✅ Feature "$featureName" added successfully.');
//       } catch (e) {
//         print('❌ Error creating feature "$featureName": $e');
//       }
//       break;
//
//     default:
//       print('❌ Unknown command: ${arguments[0]}');
//       print('''
// Usage: apryt <command>
// Commands:
//   init - Creates assetsTest folder
//   generate <flavor> <build_type> - Generates APK name
//   add feat <feature_name> - Adds a new feature folder in lib/feature
// ''');
//       break;
//   }
// }


void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printUsage();
    return;
  }

  switch (arguments[0]) {
    case 'init':
      apryt.init();
      break;
    case 'generate':
      if (arguments.length < 3) {
        print('❌ Error: Missing arguments. Usage: apryt generate <flavor> <build_type>');
        return;
      }
      String flavor = arguments[1];
      String buildType = arguments[2];

      try {
        String apkName = apryt.generateAppName(
          flavor: flavor,
          buildType: buildType,
        );
        print('📝 Generated File Name: $apkName');
      } catch (e) {
        print('❌ Error generating APK name: $e');
      }
      break;
    case 'add':
      if (arguments.length < 3 || arguments[1] != 'feat') {
        print('❌ Error: Usage: apryt add feat <feature_name>');
        return;
      }
      String featureName = arguments[2];
      try {
        apryt.createFeature(featureName: featureName);
      } catch (e) {
        print('❌ Error creating feature "$featureName": $e');
      }
      break;
    default:
      printUsage();
  }
}

void printUsage() {
  print('''
Usage: apryt <command>
Commands:
  init - Creates project folders and files
  generate <flavor> <build_type> - Generates APK name
  add feat <feature_name> - Adds a new feature folder in lib/feature
''');
}
