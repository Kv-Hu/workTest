//
//  DDBaseModel.h
//  iMarboo
//
//  Created by amoblin on 15/11/25.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "JSONModel.h"

@interface DDBaseModel : JSONModel

- (void)updateWithDictionary:(NSDictionary *)dict;
- (void)updateWithModel:(DDBaseModel *)model;

+ (NSDictionary *)customKeyMapper;
@end
