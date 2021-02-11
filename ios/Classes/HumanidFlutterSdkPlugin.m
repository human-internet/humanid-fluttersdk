#import "HumanidFlutterSdkPlugin.h"
#if __has_include(<humanid_flutter_sdk/humanid_flutter_sdk-Swift.h>)
#import <humanid_flutter_sdk/humanid_flutter_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "humanid_flutter_sdk-Swift.h"
#endif

@implementation HumanidFlutterSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHumanidFlutterSdkPlugin registerWithRegistrar:registrar];
}
@end
