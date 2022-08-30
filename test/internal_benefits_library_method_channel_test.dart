import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internal_benefits_library/internal_benefits_library_method_channel.dart';

void main() {
  MethodChannelInternalBenefitsLibrary platform = MethodChannelInternalBenefitsLibrary();
  const MethodChannel channel = MethodChannel('internal_benefits_library');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
