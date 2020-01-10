//
//  ThirdViewController.m
//  MutipleLanguage
//
//  Created by yfm on 2020/1/10.
//  Copyright © 2020 yfm. All rights reserved.
//

#import "ThirdViewController.h"
#import "LanguageSettingViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)dealloc {
    NSLog(@"Third dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = kCameraLocal(@"Third");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoL) name:kGotoLanguageNotification object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LanguageSettingViewController *vc = [[LanguageSettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoL {
    NSLog(@"gotoL");
    LanguageSettingViewController *vc = [[LanguageSettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
