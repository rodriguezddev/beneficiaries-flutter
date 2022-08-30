#import "InternalBenefitsLibraryPlugin.h"
#if __has_include(<internal_benefits_library/internal_benefits_library-Swift.h>)
#import <internal_benefits_library/internal_benefits_library-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "internal_benefits_library-Swift.h"
#endif

@implementation InternalBenefitsLibraryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInternalBenefitsLibraryPlugin registerWithRegistrar:registrar];
}
@end
