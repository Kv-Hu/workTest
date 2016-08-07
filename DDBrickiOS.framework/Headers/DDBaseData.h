//
//  DDBaseData.h
//  iMarboo
//
//  Created by amoblin on 15/11/24.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "DDBaseModel.h"

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>
#import "DDBaseTableViewCell.h"

#else

#import <Cocoa/Cocoa.h>
#import "DDBaseTableCellView.h"
#import "DDBaseTableRowView.h"

#endif

@interface DDBaseData : DDBaseModel

@property (nonatomic, copy) void (^pressAction)(id data);
@property (nonatomic, strong) NSObject *model;
@property (nonatomic, assign) NSInteger sequence;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *path; // for File
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *subFileArray;
@property (nonatomic, strong) NSArray *subFolderArray;

#if TARGET_OS_IPHONE

@property (nonatomic, assign) CGSize itemSize; // UITableViewCell height

@property (nonatomic, strong) UIColor *titleColor; // UITableViewCell height
@property (nonatomic, strong) UIFont  *font; // UITableViewCell height

@property (nonatomic, assign) UITableViewCellSelectionStyle cellSelectionStyle;

#else

@property (nonatomic, assign) NSSize itemSize; // UITableViewCell height

#endif

@property (nonatomic, assign) BOOL isSelected;

- (instancetype)initWithModel:(NSObject *)model;

@end
