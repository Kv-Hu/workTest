//
//  ViewController.m
//  workTest
//
//  Created by Kevin on 16/8/7.
//  Copyright © 2016年 Kevin. All rights reserved.
//


#import "ViewController.h"
#import "KVTableViewController.h"


@interface ViewController ()<UIScrollViewDelegate>

@property(strong,nonatomic)UIScrollView *titleScrollView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIScrollView *contentScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildVc];
    [self setUpTitleScrollView];
    [self setUpContentScrollView];
    
    
    

}
-(void)setUpChildVc{

    KVTableViewController *Vc0 = [[KVTableViewController alloc]init];
    Vc0.title = @"国际";
    [self addChildViewController:Vc0];
    
    KVTableViewController *Vc1 = [[KVTableViewController alloc]init];
    Vc1.title = @"军事";
    [self addChildViewController:Vc1];
    
    KVTableViewController *Vc2 = [[KVTableViewController alloc]init];
    Vc2.title = @"娱乐";
    [self addChildViewController:Vc2];
    
    KVTableViewController *Vc3 = [[KVTableViewController alloc]init];
    Vc3.title = @"政治";
    [self addChildViewController:Vc3];
    
    KVTableViewController *Vc4 = [[KVTableViewController alloc]init];
    Vc4.title = @"体育";
    [self addChildViewController:Vc4];
    
    KVTableViewController *Vc5 = [[KVTableViewController alloc]init];
    Vc5.title = @"科技";
    [self addChildViewController:Vc5];
    
    KVTableViewController *Vc6 = [[KVTableViewController alloc]init];
    Vc6.title = @"时尚";
    [self addChildViewController:Vc6];

}

-(void)setUpTitleScrollView{

    UIScrollView *titleScrollView = [[UIScrollView alloc]init];
    titleScrollView.backgroundColor = [UIColor grayColor];
    
   
    _titleScrollView = titleScrollView;
    [self.view addSubview:titleScrollView];
    
    [titleScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(@36);
        
    }];
    [self setUpTitle];

}
-(void)setUpContentScrollView{
    UIScrollView *contentScrollView = [[UIScrollView alloc]init];
    contentScrollView.backgroundColor = [UIColor greenColor];
    
    contentScrollView.contentSize = CGSizeMake(7 *[UIScreen mainScreen].bounds.size.width, 0);
    contentScrollView.pagingEnabled = YES;
    contentScrollView.delegate = self;
    self.contentScrollView = contentScrollView;
    [self.view addSubview:contentScrollView];
    [contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleScrollView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];


}

-(void)setUpTitle{
    CGFloat labelY = 0;
    CGFloat labelW = 100;
    CGFloat  labelH = 36;
   self.titleScrollView.contentSize = CGSizeMake(7*labelW, 0);
 self.titleScrollView.showsHorizontalScrollIndicator = NO;
    for (NSInteger i = 0; i < 7; i++) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = [self.childViewControllers[i] title];
        titleLabel.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:arc4random_uniform(100)/100.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
      CGFloat labelX = i *labelW;
     
        titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
        ;
        [titleLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
        titleLabel.userInteractionEnabled = YES;
        titleLabel.tag = i;
        self.titleLabel = titleLabel;
        [self.titleScrollView addSubview:titleLabel];
    
      
    }
    

}
-(void)labelClick:(UITapGestureRecognizer *)tap{
    
    NSInteger index = tap.view.tag;
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = index * self.contentScrollView.frame.size.width;
   
    [self.contentScrollView setContentOffset:offset animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - <UIScrollViewDelgate>

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

   NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
   UIViewController *willShowVc = self.childViewControllers[index];
    willShowVc.view.frame = CGRectMake(scrollView.contentOffset.x, -64, scrollView.frame.size.width, scrollView.frame.size.height);
    [self.contentScrollView addSubview:willShowVc.view];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [self scrollViewDidEndScrollingAnimation:scrollView];
}
@end
