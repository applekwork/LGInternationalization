//
//  Language.h
//
//  Created by Aufree on 12/5/15.
//  Copyright (c) 2015 The EST Group. All rights reserved.
//

#import <Foundation/Foundation.h>

// replace the NSLocalizedString() in run time
#define kLang(key) [Language get:key alter:nil]
#define LanguageCode @[@"fr", @"zh-Hans"]

/** 当前应该加载的语言类型 */
typedef NS_ENUM(NSInteger, LanguageType) {
    /** 汉语 */
    LanguageTypeChinese   =    1,
    /** 英语 */
    LanguageTypeEnglish   =    2,
    /** 法语 */
    LanguageTypeFrench    =    3
};

@interface Language : NSObject

+ (void)initialize;
+ (void)setLanguage:(NSString *)language;
+ (NSString*)currentLanguageCode;
+ (void)userSelectedLanguage:(NSString *)selectedLanguage;
+ (NSString *)get:(NSString *)key alter:(NSString *)alternate;

/**
 * 获取当前设置的多语言类型
 * @return 返回当前设置的多语言类型，默认是汉语
 */
+ (LanguageType)languageType;
/**
 * 设置多语言类型
 * @param type 将要设置的多语言类型
 */
+ (void)setLanguageType:(LanguageType)type;

@end
