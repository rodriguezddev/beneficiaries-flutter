import 'package:flutter_test/flutter_test.dart';
import 'package:internal_benefits_library/internal_benefits_library.dart';
import 'package:internal_benefits_library/internal_benefits_library_platform_interface.dart';
import 'package:internal_benefits_library/internal_benefits_library_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInternalBenefitsLibraryPlatform 
    with MockPlatformInterfaceMixin
    implements InternalBenefitsLibraryPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InternalBenefitsLibraryPlatform initialPlatform = InternalBenefitsLibraryPlatform.instance;

  test('$MethodChannelInternalBenefitsLibrary is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInternalBenefitsLibrary>());
  });

  test('getPlatformVersion', () async {
    InternalBenefitsLibrary internalBenefitsLibraryPlugin = InternalBenefitsLibrary();
    MockInternalBenefitsLibraryPlatform fakePlatform = MockInternalBenefitsLibraryPlatform();
    InternalBenefitsLibraryPlatform.instance = fakePlatform;
  
    expect(await internalBenefitsLibraryPlugin.getPlatformVersion(), '42');
  });
}
