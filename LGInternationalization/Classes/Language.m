//
//  Language.h
//
//  Created by Aufree on 12/5/15.
//  Copyright (c) 2015 The EST Group. All rights reserved.
//

#import "Language.h"
#import "LanguageContainer.h"

@implementation Language

static NSBundle *bundle = nil;

NSString *const LanguageCodeIdIndentifier = @"LanguageCodeIdIndentifier";

//默认汉语
+ (LanguageType)languageType {
    NSString *type = [self currentLanguageCode];
    if ([type isEqualToString:@"zh-Hans"]) {
        return LanguageTypeChinese;
    }
    if ([type isEqualToString:@"fr"]) {
        return LanguageTypeFrench;
    }
    if ([type isEqualToString:@"en"]) {
        return LanguageTypeEnglish;
    }
    return LanguageTypeChinese;
}
//默认设置汉语
+ (void)setLanguageType:(LanguageType)type {
    switch (type) {
        case LanguageTypeChinese:
            [self userSelectedLanguage:@"zh-Hans"];
            [[LanguageContainer sharedLanguageContainer] reloadUI:nil completBlock:nil];
            break;
        case LanguageTypeFrench:
            [self userSelectedLanguage:@"fr"];
            [[LanguageContainer sharedLanguageContainer] reloadUI:nil completBlock:nil];
            break;
        case LanguageTypeEnglish:
            [self userSelectedLanguage:@"en"];
            [[LanguageContainer sharedLanguageContainer] reloadUI:nil completBlock:nil];
            break;
            
        default:
            [self userSelectedLanguage:@"zh-Hans"];
            [[LanguageContainer sharedLanguageContainer] reloadUI:nil completBlock:nil];
            break;
    }
}

+ (void)initialize {
    NSString *userSelectedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCodeIdIndentifier];
    if ([userSelectedLanguage length] == 0) {
        NSArray *inSetLanguageArray = @[@"zh-Hans",@"fr",@"en"];
        NSArray *array = [[NSBundle mainBundle] preferredLocalizations];
        NSString *current = nil;
        if ([array count] > 0) {
            current = [array firstObject];
        }
        if (current && [inSetLanguageArray containsObject:current]) {
            current = [array firstObject];
        } else {
            current = @"zh-Hans";
        }
        [self userSelectedLanguage:current];
    } else {
        [self userSelectedLanguage:userSelectedLanguage];
    }

}

+ (void)setLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

+ (NSString *)currentLanguageCode {
    NSString *userSelectedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCodeIdIndentifier];
    if (userSelectedLanguage) {
        // Store selected language in local
        
        return userSelectedLanguage;
    } else {
        return @"zh-Hans";
    }
//    NSString *systemLanguage = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
//    if ([systemLanguage isEqualToString:@"fr"] || [systemLanguage isEqualToString:@"en"]) {
//        // Update selected language in local
//    } else {
//        // Update selected language in local
//        systemLanguage = @"zh-Hans";
//    }
//    
//    return systemLanguage;
}

+ (void)userSelectedLanguage:(NSString *)selectedLanguage {
    // Store the data
    // Store selected language in local
    
    [[NSUserDefaults standardUserDefaults] setObject:selectedLanguage forKey:LanguageCodeIdIndentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];

    // Set global language
    [Language setLanguage:selectedLanguage];
}

+ (NSString *)get:(NSString *)key alter:(NSString *)alternate {
    return [bundle localizedStringForKey:key value:alternate table:nil];
}

@end
