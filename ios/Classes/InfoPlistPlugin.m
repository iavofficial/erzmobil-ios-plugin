#import "InfoPlistPlugin.h"

@implementation InfoPlistPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"info_plist"
            binaryMessenger:[registrar messenger]];
  InfoPlistPlugin* instance = [[InfoPlistPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"isDebugVersion" isEqualToString:call.method]){
    result([[NSBundle mainBundle] objectForInfoDictionaryKey:@"DebugLog"]?: @NO);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
