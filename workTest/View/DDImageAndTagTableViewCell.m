//
//  DDImageAndTagCell.m
//  workTest
//
//  Created by Kevin on 16/8/8.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "DDImageAndTagTableViewCell.h"

#import <Masonry.h>

@interface DDImageAndTagTableViewCell ()

@property(nonatomic,strong) UIImageView *titleImageView;
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *subTitleLabel;
@property(nonatomic,strong) UILabel *timeLabel;

@end

@implementation DDImageAndTagTableViewCell

-(void)setupSubviews {
        self.titleImageView = [[UIImageView alloc] init];
//        self.titleImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.titleImageView];
    
        self.titleLabel = [[UILabel alloc] init];
//        self.titleLabel.backgroundColor = [UIColor grayColor];
   
        [self addSubview:self.titleLabel];
    
        self.subTitleLabel = [[UILabel alloc] init];
//        self.subTitleLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:self.subTitleLabel];
    
        self.timeLabel = [[UILabel alloc] init];
//        self.timeLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.timeLabel];
}


-(void)configConstraints {

        [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
            make.width.equalTo(@40);
        }];
    
    
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleImageView.mas_right).offset(20);
            make.top.equalTo(self.titleImageView.mas_top).offset(0);
            make.right.equalTo(self.timeLabel.mas_left).offset(-30);
            make.height.equalTo(@20);
   
        }];
    
    
        [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
            make.left.equalTo(self.titleImageView.mas_right).offset(20);
             make.right.equalTo(self.timeLabel.mas_left).offset(-30);
            make.bottom.equalTo(self).offset(-5);
        }];

    
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-5);
            make.top.equalTo(self).offset(5);
            make.width.equalTo(@40);
            make.height.equalTo(@15);
        }];
}

-(void)configCell {

    self.ImageAndTagData = (DDImageAndTagData *)self.data ;
    self.titleLabel.text = _ImageAndTagData.titleText;
    self.subTitleLabel.text = _ImageAndTagData.subTitleText;
    self.timeLabel.text = _ImageAndTagData.tagText;
}

@end
