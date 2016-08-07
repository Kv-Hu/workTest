//
//  DDBaseTableViewCell.h
//  DDBrickDemo
//
//  Created by amoblin on 16/5/1.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "Masonry.h"
#import "UILabel+DD.h"
#import "DDColors.h"
#import "DDFonts.h"

@class DDBaseData;

@interface DDBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) DDBaseData *data; // cell data

+ (NSString *)DDReuseIdentifier; // cell reuse identifier, subclass use as it
+ (CGFloat)heightForData:(DDBaseData *)data; // cell height, subclass override
+ (CGFloat)defaultHeight;

// 添加布局组件
- (void)setupSubviews;

// 设置组件约束
- (void)configConstraints;

// 使用数据填充界面
- (void)configCell; // subclass override

@end
