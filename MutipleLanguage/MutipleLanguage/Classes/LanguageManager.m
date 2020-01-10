//
//  LanguageManager.m
//  MutipleLanguage
//
//  Created by yfm on 2020/1/10.
//  Copyright © 2020 yfm. All rights reserved.
//

#import "LanguageManager.h"

@interface LanguageManager()
@property (strong, nonatomic) NSBundle *bundle;
@end

@implementation LanguageManager

+ (LanguageManager *)shared {
    static LanguageManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSString *)curLanguage {
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"curLanguage"];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    if(!path) {
        language = @"en";
        self.bundle = [NSBundle mainBundle];
    }
    return language;
}

- (void)setCurLanguage:(NSString *)curLanguage {
//    NSString *local = [[NSUserDefaults standardUserDefaults] objectForKey:@"curLanguage"];
//    NSLog(@"=== %@", local);
//    if(local && [curLanguage isEqualToString:[self curLanguage]]) {
//        return;
//    }
//
    [[NSUserDefaults standardUserDefaults] setObject:curLanguage forKey:@"curLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:curLanguage ofType:@"lproj"];
    if(path) {
        self.bundle = [NSBundle bundleWithPath:path];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeLanguageNotification" object:nil];
}

- (NSString *)localizeStringForKey:(NSString *)key table:(NSString *)table {
    return [self.bundle localizedStringForKey:key value:nil table:table];
}

@end
