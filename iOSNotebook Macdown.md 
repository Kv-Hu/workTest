#iOS笔记

## 设计模式：**MVC**模式复习
**MVC**根据角色划分类，涉及到三个角色：

**Model**:模型保存应用程序的数据。

**View**：视图是模型的可视化表示以及用户交互的控件。

**Controller**:控制器是一个协调所有工作的中介者。它访问模型中的数据并在视图中展示它们，同时它们还监听事件和操作数据。

![MacDown Screenshot](http://images2015.cnblogs.com/blog/755161/201510/755161-20151024111915458-112572637.png)

模型会把任何数据的变更通知控制器，然后控制器更新视图数据。视图对象通知控制器用户的操作，控制器要么根据需要来更新模型，要么检索任何被请求的数据。

在理想的状态下，视图应该和模型完全的分离。如果视图不依赖某个实际的模型，那么视图就可以被复用来展示不同模型的数据。

我们看一个简单的例子：

```
#import <Foundation/Foundation.h>

@interface KVDiscoverCellItem : NSObject
@property(nonatomic,strong)UIImage *titleImage;
@property(nonatomic,strong)UIImage *iconImage;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)void(^itemOperation)();

+(instancetype)itemWithTitleImage:(UIImage *)image iconImage:(UIImage *)iconImage andText:(NSString *)text;
@end

```

```
#import <UIKit/UIKit.h>
#import "KVDiscoverCellItem.h"

@interface KVDiscoverCell : UITableViewCell
@property(nonatomic,strong)KVDiscoverCellItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end

```
```
#import "KVDiscoverViewController.h"
#import "KVDiscoverCellItem.h"
#import "KVDiscoverCell.h"
#import "KVDiscoverPushViewController.h"
#import "KVDiscover2PushViewController.h"

@interface KVDiscoverViewController ()

@property(nonatomic,strong)NSMutableArray *groups;

@end

@implementation KVDiscoverViewController

-(NSMutableArray *)groups{

    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;

}

- (void)viewDidLoad {
    [super viewDidLoad]; 
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup3];
    [self setUpGroup4];
}

-(void)setUpGroup1{

    KVDiscoverCellItem *item = [KVDiscoverCellItem itemWithTitleImage:[UIImage imageNamed:@"discovery_groupBuy_title"] iconImage:[UIImage imageNamed:@"discovery_groupBuy_icon"] andText:@"跟着高手买，奖金一起分"];
    item.itemOperation = ^{    
        KVDiscoverPushViewController *pushVc = [[KVDiscoverPushViewController alloc]init];
    
        [self.navigationController pushViewController:pushVc animated:YES];
       
   };
        
    NSArray *group = @[item];
    
    [self.groups addObject:group];
}


```

## 设计模式：**MVVM**模式
**MVVM** 是什么,我们先看一个典型的iOS是如何构建的：
![MacDown Screenshot](https://www.objccn.io/images/issues/issue-13/mvvm1.png)
我们看到的是一个典型的 MVC 设置。Model 呈现数据，View 呈现用户界面，而 View Controller 调节它两者之间的交互。

在典型的 MVC 应用里，许多逻辑被放在 View Controller 里。它们中的一些确实属于 View Controller，但更多的是所谓的“表示逻辑（presentation logic）”，以 MVVM 属术语来说，就是那些将 Model 数据转换为 View 可以呈现的东西的事情，例如将一个 NSDate 转换为一个格式化过的 NSString。

我们的图解里缺少某些东西，那些使我们可以把所有表示逻辑放进去的东西。我们打算将其称为 “View Model” —— 它位于 View/Controller 与 Model 之间：
![MacDown Screenshot](https://www.objccn.io/images/issues//issue-13/mvvm.png)

这个图解准确地描述了什么是 MVVM：一个 MVC 的增强版，我们正式连接了视图和控制器，并将表示逻辑从 Controller 移出放到一个新的对象里，即 View Model。MVVM 听起来很复杂，但它本质上就是一个精心优化的 MVC 架构。

此处有三个重点是我希望你看完本文能带走的：

* MVVM 可以兼容你当下使用的 MVC 架构。

* MVVM 增加你的应用的可测试性。

* MVVM 配合一个绑定机制效果最好。


## 框架：**DDBrickiOS**

插入DDBrickiOS框架，可以实现一个继承自DDBaseTableViewController的viewController上显示不同布局的cell。

```
#import <UIKit/UIKit.h>
#import <DDBrickiOS/DDBaseTableViewController.h>
@interface ViewController :DDBaseTableViewController
@end
```

```
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
  
   self.dataArray = @[gapData,imageData];

}

```

自定义一个cell，继承自DDBaseTableViewCell：

```
DDImageAndTagCell.h

#import <DDBrickiOS/DDBrickiOS.h>
#import <DDBrickiOS/DDBaseTableViewCell.h>
#import "DDImageAndTagData.h"

@interface DDImageAndTagTableViewCell : DDBaseTableViewCell

@property(nonatomic,strong)DDImageAndTagData *ImageAndTagData;
@end
```
```
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
```







