//
//  LanguageContainer.m
//  LGInternationalization
//
//  Created by LG on 16/1/5.
//  Copyright © 2016年 LG. All rights reserved.
//

#import "LanguageContainer.h"

@interface LanguageContainer ()
@property (nonatomic, strong) NSMutableArray  *controllerContains;

@end

@implementation LanguageContainer
+ (LanguageContainer *)sharedLanguageContainer {
    static LanguageContainer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LanguageContainer alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        CFArrayCallBacks callBacks = {0,NULL,NULL,CFCopyDescription,CFEqual};
        _controllerContains = (__bridge_transfer NSMutableArray *)(CFArrayCreateMutable(0, 0, &callBacks));
    }
    return self;
}

- (void)addLanguageChangeController:(NSObject<LanguageChange> *)vc {
    [self.controllerContains addObject:vc];
}

- (void)removeLanguageChangeController:(NSObject<LanguageChange> *)vc {
    [self.controllerContains removeObject:vc];
}
//删除所有添加到多语言中的控制器
- (void)removeLanguageChangeAllControllers {
    [self.controllerContains removeAllObjects];
}
- (void)reloadUI:(void (^)())beginblock completBlock:(void (^)(void))completblock {
    if (beginblock) {
        beginblock();
    }
    
    for (NSObject<LanguageChange> *object in self.controllerContains) {
        if ([object conformsToProtocol:@protocol(LanguageChange)]) {
             [object reloadUIWhenLanguageChange];
        }
       
    }
    if (completblock) {
        completblock();
    }
    
}
@end
