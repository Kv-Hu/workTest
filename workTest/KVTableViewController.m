//
//  KVTableViewController.m
//  workTest
//
//  Created by Kevin on 16/8/10.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVTableViewController.h"
#import <DDBrickiOS/DDTitleData.h>
#import <DDBrickiOS/DDGapData.h>
#import <DDBrickiOS/DDImageData.h>
#import <DDBrickiOS/DDBannerData.h>
#import <DDBrickiOS/DDTitleAndSubtitleData.h>
#import <DDBrickiOS/DDImageAndIntroData.h>
#import "DDImageAndTagData.h"
@interface KVTableViewController ()

@end

@implementation KVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DDTitleData *titleData = [[DDTitleData alloc] initWithTitle:self.title];
    DDImageData *imageData = [[DDImageData alloc] init];
    imageData.image = @"http://d.lanrentuku.com/down/png/1512/2015sdj/2015sdj_002.png";
    self.dataArray = @[titleData,imageData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
