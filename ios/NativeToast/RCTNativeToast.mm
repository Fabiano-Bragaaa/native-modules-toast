#import "RCTNativeToast.h"
#import <UIKit/UIKit.h>

@implementation RCTNativeToast



- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
  (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeToastSpecJSI>(params);
}


+ (NSString *)moduleName
{
  return @"NativeToast";
}


- (void)showToast:(NSString *)message
{
  dispatch_async(dispatch_get_main_queue(), ^{
    
    UIWindowScene *activeScene = nil;

    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
      if ([scene isKindOfClass:[UIWindowScene class]] &&
          scene.activationState == UISceneActivationStateForegroundActive) {
        activeScene = (UIWindowScene *)scene;
        break;
      }
    }

    if (!activeScene) {
      return;
    }

    UIWindow *window = activeScene.windows.firstObject;
    UIViewController *rootViewController = window.rootViewController;

    if (!rootViewController) {
      return;
    }

    UIAlertController *alert =
      [UIAlertController alertControllerWithTitle:nil
                                          message:message
                                   preferredStyle:UIAlertControllerStyleAlert];

    [rootViewController presentViewController:alert animated:YES completion:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{
      [alert dismissViewControllerAnimated:YES completion:nil];
    });
  });
}

@end
