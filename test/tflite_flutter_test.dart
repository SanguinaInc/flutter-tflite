import 'package:flutter_test/flutter_test.dart';
import 'package:tflite_flutter/tflite_flutter_platform_interface.dart';
import 'package:tflite_flutter/tflite_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTfliteFlutterPlatform
    with MockPlatformInterfaceMixin
    implements TfliteFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TfliteFlutterPlatform initialPlatform = TfliteFlutterPlatform.instance;

  test('$MethodChannelTfliteFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTfliteFlutter>());
  });

  test('getPlatformVersion', () async {
    TfliteFlutter tfliteFlutterPlugin = TfliteFlutter();
    MockTfliteFlutterPlatform fakePlatform = MockTfliteFlutterPlatform();
    TfliteFlutterPlatform.instance = fakePlatform;

    expect(await tfliteFlutterPlugin.getPlatformVersion(), '42');
  });
}
