import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'internal_benefits_library_method_channel.dart';

abstract class InternalBenefitsLibraryPlatform extends PlatformInterface {
  /// Constructs a InternalBenefitsLibraryPlatform.
  InternalBenefitsLibraryPlatform() : super(token: _token);

  static final Object _token = Object();

  static InternalBenefitsLibraryPlatform _instance = MethodChannelInternalBenefitsLibrary();

  /// The default instance of [InternalBenefitsLibraryPlatform] to use.
  ///
  /// Defaults to [MethodChannelInternalBenefitsLibrary].
  static InternalBenefitsLibraryPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InternalBenefitsLibraryPlatform] when
  /// they register themselves.
  static set instance(InternalBenefitsLibraryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
