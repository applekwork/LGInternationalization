//
//  LanguageChange.h
//  LGInternationalization
//
//  Created by LG on 18/11/15.
//  Copyright © 2016年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LanguageChange <NSObject>
@optional
- (void)reloadUIWhenLanguageChange;
@end
