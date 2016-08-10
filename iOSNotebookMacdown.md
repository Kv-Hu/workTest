#iOS笔记

## iOS技能树

### 基本通用技能
0. 指法练习。要求字母键的指法正确，能够盲打数字键、熟练打字符键。
1. Linux相关(1d)。具体为在zsh/oh-my-zsh环境下熟练使用基本的linux命令: cd ls mkdir cp mv
2. Git（1d）。熟练使用以下命令：status add commit pull push log diff
3. Vim（1d）。熟练使用以下指令：h j k l a i o p x d w b f g
4. Markdown（0.5d)。

### OC基础
1. 内存管理：ARC
2. Thread/Runloop
3. Runtime

### 设计模式
1. MVC
2. MVVM
3. Protocol
4. KVO
5. Notification
6. Block
7. Category
8. 单例

### iOS基础
1. Autolayout: Masonry
2. Draw UI with Code
3. TableView
4. CollectionView

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

## 2016/8/09 上午
学习MVVM设计思想。参考文献：

<https://www.objccn.io/issue-13-1/>
<http://www.cocoachina.com/ios/20150525/11930.html>


## 2016/8/09 下午
父子控制器实例。编写程序，并运行。

## 2016/8/09 晚上
git的使用学习

git的作用：

<https://www.git-tower.com/learn/git/ebook/cn/command-line/basics/why-use-version-control>

<http://www.ui.cn/detail/20957.html>

**git log**

git log主要用来显示分支中提交更改的记录。当执行git commit以存储一个快照的时候，文件详单、提交消息和提交者的信息、此次提交所基于的快照都会被保存。

**git status**

git status，查看你的代码在缓存与当前工作目录的状态
git status -s，将结果以简短的形式输出

**git add**

**git add**，在提交你修改的文件之前，你需要把它们添加到暂存区。如果该文件是新创建的，你可以执行将该文件添加到暂存区
**git add .** ，Git会递归地将你执行命令时所在的目录中的所有文件添加上去，所以如果你将当前的工作目录作为参数，它就会追踪那儿的所有文件
**git add -u**，使用-u参数调用了git add命令，会将本地有改动（包括删除和修改）的已经追踪的文件标记到暂存区中。
**git add -A**，使用-A参数会将添加所有改动的已跟踪文件和未跟踪文件。
**git add -i**，交互式的方式进行添加。

**git commit*

**git commit --amend**，修补式提交。

**git commit --a**，对本地所有变更的文件执行提交操作，包括对本地修改的文件和删除的文件，但是不包括未被版本库跟踪的文件。但是这个命令最好不要使用，这样会丢掉Git暂存区带给用户的最大好处：对提交内容进行控制的能力

**git push**

**git push** <remote> [branch]，就会将你的 [branch] 分支推送成为 [alias] 远端上的 [branch] 分支，要推送的远程版本号的URL地址由remote.<remote>.pushurl给出，如果没有配置，则使用remote.<remote>.url配置的URL地址。


