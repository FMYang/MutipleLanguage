//
//  SPTabBarController.m
//  MutipleLanguage
//
//  Created by yfm on 2020/1/10.
//  Copyright © 2020 yfm. All rights reserved.
//

#import "SPTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

typedef NS_ENUM(NSUInteger, kTabBarType) {
    kTabBarType_first,
    kTabBarType_second,
    kTabBarType_third,
};

@interface SPTabBarController ()
@end

@implementation SPTabBarController

- (void)dealloc {
    NSLog(@"tabbar dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *types = @[@(kTabBarType_first), @(kTabBarType_second), @(kTabBarType_third)];
    NSMutableArray *vcs = [@[] mutableCopy];
    for(NSNumber *num in types) {
        UIViewController *vc = [self controllerWithType:[num integerValue]];
        [vcs addObject:vc];
    }
    self.viewControllers = vcs;
}

- (UIViewController *)controllerWithType:(kTabBarType)type {
    UIViewController *vc;
    switch (type) {
        case kTabBarType_first: {
            vc = [[FirstViewController alloc] init];
        }
            break;
        
        case kTabBarType_second:
            vc = [[SecondViewController alloc] init];
            break;
            
        case kTabBarType_third:
            vc = [[ThirdViewController alloc] init];
            break;
            
        default:
            break;
    }
    vc.tabBarItem = [self tabbarItemWithType:type];
    return [[UINavigationController alloc] initWithRootViewController:vc];
}

- (UITabBarItem *)tabbarItemWithType:(kTabBarType)type {
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:[self titleWithType:type] image:[UIImage new] tag:type];
    return item;
}

- (NSString *)titleWithType:(kTabBarType)type {
    NSString *str = @"";
    switch (type) {
        case kTabBarType_first:
            str = kCameraLocal(@"First");
            break;
            
        case kTabBarType_second:
            str = kCameraLocal(@"Second");
            break;
            
        case kTabBarType_third:
            str = kCameraLocal(@"Third");
            break;
            
        default:
            break;
    }
    
    return str;
}

@end
