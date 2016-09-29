//
//  LuckyRecordViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/15.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "LuckyRecordViewController.h"
#import "WinnerInfomationViewController.h"
#import "LogisticsViewController.h"
#import "MyShareViewController.h"
#import "PersonalLuckyCellCell.h"
#import "LuckyRecordCell.h"

@interface LuckyRecordViewController () <UITableViewDataSource, UITableViewDelegate, LuckyRecordCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *layouts;

@end

@implementation LuckyRecordViewController

- (NSMutableArray *)layouts {
    if (!_layouts) {
        _layouts = [NSMutableArray array];
    }
    return _layouts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"幸运记录";
    [_tableView setCustomSeparatorInset:UIEdgeInsetsZero];
    @weakify(self);
    _tableView.mj_header =  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        @strongify(self);
        CGFloat delayTime = dispatch_time(DISPATCH_TIME_NOW, 2);
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self getLuckyRecord];
            [self.tableView.mj_header endRefreshing];
        });
    }];
    [_tableView.mj_header beginRefreshing];
}

- (void)getLuckyRecord {
    for (int i=0; i<2; i++) {
        LuckyRecordModel *model = [[LuckyRecordModel alloc]init];
        LuckyRecordLayout *layout = [[LuckyRecordLayout alloc]initWithModel:model];
        [self.layouts addObject:layout];
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LuckyRecordCell *cell = [LuckyRecordCell cellWithTableView:tableView];
    LuckyRecordLayout *layout = _layouts[indexPath.row];
    cell.delegate = self;
    cell.layout = layout;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LuckyRecordLayout *layout = _layouts[indexPath.row];
    return layout.height;
}

#pragma mark - LuckyRecordCellDelegate
- (void)signButtonClickedCell:(LuckyRecordCell *)cell {
    WinnerInfomationViewController *vc = [[WinnerInfomationViewController alloc]init];
    [self hideBottomBarPush:vc];
}

- (void)shareButtonClickedCell:(LuckyRecordCell *)cell {
    MyShareViewController *vc = [[MyShareViewController alloc]init];
    [self hideBottomBarPush:vc];
}

- (void)logisticButtonClickedCell:(LuckyRecordCell *)cell {
    LogisticsViewController *vc = [[LogisticsViewController alloc]init];
    [self hideBottomBarPush:vc];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end
