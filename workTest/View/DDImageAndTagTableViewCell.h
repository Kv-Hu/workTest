//
//  DDImageAndTagCell.h
//  workTest
//
//  Created by Kevin on 16/8/8.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <DDBrickiOS/DDBrickiOS.h>
#import <DDBrickiOS/DDBaseTableViewCell.h>
#import "DDImageAndTagData.h"


@interface DDImageAndTagTableViewCell : DDBaseTableViewCell

@property(nonatomic,strong)DDImageAndTagData *ImageAndTagData;

@end
