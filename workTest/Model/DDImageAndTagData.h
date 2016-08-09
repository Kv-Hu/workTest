//
//  DDImageAndTagData.h
//  workTest
//
//  Created by Kevin on 16/8/8.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DDBrickiOS/DDBaseData.h>


@interface DDImageAndTagData : DDBaseData

@property(nonatomic,strong)NSString *imageName;
@property(nonatomic,strong)NSString *titleText;
@property(nonatomic,strong)NSString *subTitleText;
@property(nonatomic,strong)NSString *tagText;

+(instancetype)dataWithTitleImageName:(NSString *)imageName titleText:(NSString *)titleText subTitleText:(NSString *)subTitleText tagText:(NSString *)tagText;

@end
