//
//  AppDelegate.m
//  MutipleLanguage
//
//  Created by yfm on 2020/1/10.
//  Copyright © 2020 yfm. All rights reserved.
//

#import "AppDelegate.h"
#import "SPTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    
    LanguageManager.shared.curLanguage = @"zh-Hans";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changedAction) name:kChangeLanguageNotification object:nil];
    
    SPTabBarController *rootVC = [[SPTabBarController alloc] init];
    self.window.rootViewController = rootVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)changedAction {
    SPTabBarController *rootVC = [[SPTabBarController alloc] init];
    self.window.rootViewController = rootVC;
    rootVC.selectedIndex = 2;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kGotoLanguageNotification object:nil];
    });
}

@end
