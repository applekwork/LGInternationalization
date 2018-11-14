//
//  LanguageContainer.h
//  LGInternationalization
//
//  Created by LG on 16/1/5.
//  Copyright © 2016年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LanguageChange.h"

@interface LanguageContainer : NSObject
+ (LanguageContainer *)sharedLanguageContainer;
- (void)addLanguageChangeController:(NSObject<LanguageChange> *)vc;
- (void)removeLanguageChangeController:(NSObject<LanguageChange> *)vc;
//删除所有添加到多语言中的控制器
- (void)removeLanguageChangeAllControllers;
- (void)reloadUI:(void (^)())beginblock completBlock:(void (^)(void))completblock;
@end
