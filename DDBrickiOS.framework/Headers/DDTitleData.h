//
//  DDTitleData.h
//  DDBrickDemo
//
//  Created by amoblin on 16/5/24.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "DDBaseData.h"

@interface DDTitleData : DDBaseData

- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title andPressAction:(void (^)())pressAction;

@end

