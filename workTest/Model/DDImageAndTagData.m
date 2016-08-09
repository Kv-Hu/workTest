//
//  DDImageAndTagData.m
//  workTest
//
//  Created by Kevin on 16/8/8.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "DDImageAndTagData.h"
#import "DDImageAndTagTableViewCell.h"

@implementation DDImageAndTagData

+(instancetype)dataWithTitleImageName:(NSString *)imageName titleText:(NSString *)titleText subTitleText:(NSString *)subTitleText tagText:(NSString *)tagText{

    DDImageAndTagData *data = [[DDImageAndTagData alloc]init];
    data.imageName = imageName;
    data.titleText = titleText;
    data.subTitleText = subTitleText;
    data.tagText = tagText;
    
    
    return data;
}

@end
