//
//  ViewController.m
//  workTest
//
//  Created by Kevin on 16/8/7.
//  Copyright © 2016年 Kevin. All rights reserved.
//


#import "ViewController.h"
#import <DDBrickiOS/DDTitleData.h>
#import <DDBrickiOS/DDGapData.h>
#import <DDBrickiOS/DDImageData.h>
#import <DDBrickiOS/DDBannerData.h>
#import <DDBrickiOS/DDTitleAndSubtitleData.h>
#import <DDBrickiOS/DDImageAndIntroData.h>
#import "DDImageAndTagData.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DDImageData *imageData = [[DDImageData alloc]init];
    imageData.image = @"http://d.lanrentuku.com/down/png/1209/duola-a-meng/duola-a-meng_49.png";
    
    DDGapData *gapData = [[DDGapData alloc] initWithCellHeight:50];
  
    DDImageAndTagData *imageAndTagData = [DDImageAndTagData dataWithTitleImageName:nil titleText:@"11" subTitleText:@"22" tagText:@"33"];
    NSLog(@"%@",imageAndTagData);
    self.dataArray = @[gapData,imageAndTagData,imageData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
