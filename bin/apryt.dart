import 'package:apryt/apryt.dart' as apryt;


void main(List<String> arguments) {
  if (arguments.length < 2) {
    print('Usage: dart run bin/apryt.dart <flavor> <build_type>');
    return;
  }

  String flavor = arguments[0];
  String buildType = arguments[1];

  try {
    // Generate the APK name (Optional for demonstration)
    String apkName = apryt.generateAppName(
      flavor: flavor,
      buildType: buildType,
    );
    print('Generated File Name: $apkName');
  } catch (e) {
    print('Error: $e');
  }
}