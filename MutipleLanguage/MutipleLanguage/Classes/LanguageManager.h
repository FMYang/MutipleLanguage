//
//  LanguageManager.h
//  MutipleLanguage
//
//  Created by yfm on 2020/1/10.
//  Copyright © 2020 yfm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanguageManager : NSObject

@property (class, readonly) LanguageManager *shared;

@property (nonatomic, copy) NSString *curLanguage;

- (NSString *)localizeStringForKey:(NSString *)key table:(NSString *)table;

@end

NS_ASSUME_NONNULL_END
