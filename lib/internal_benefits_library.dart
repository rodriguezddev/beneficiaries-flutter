
import 'internal_benefits_library_platform_interface.dart';

class InternalBenefitsLibrary {
  Future<String?> getPlatformVersion() {
    return InternalBenefitsLibraryPlatform.instance.getPlatformVersion();
  }
}
