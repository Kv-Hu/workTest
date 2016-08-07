//
//  DDTitleAndSubtitleData.h
//  iMarboo
//
//  Created by amoblin on 16/1/28.
//  Copyright © 2016年 amoblin. All rights reserved.
//

#import "DDTitleData.h"

@interface DDTitleAndSubtitleData : DDTitleData

@property (nonatomic, strong) NSString *subtitle;

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle andPressAction:(void (^)())pressAction;
@end

