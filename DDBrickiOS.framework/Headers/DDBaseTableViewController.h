//
//  DDBaseTableViewController.h
//  iMarboo
//
//  Created by amoblin on 15/11/24.
//  Copyright © 2015年 amoblin. All rights reserved.
//

#import "DDBaseListViewController.h"
#import "DDViewModel.h"

@interface DDBaseTableViewController : DDBaseListViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (nonatomic, strong) UITableView *tableView;

@end