//
//  NoticeViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "NoticeViewController.h"
#import "NoticeDetailViewController.h"
#import "NoticeCell.h"

@interface NoticeViewController () <UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

@property (nonatomic, strong) BaseTableView *tableView;

@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation NoticeViewController

- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (BaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[BaseTableView alloc]initWithFrame:({
            CGRect rect = {0,0,kScreenWidth,kScreenHeight};
            rect;
        }) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.estimatedRowHeight = 60;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorColor = UIColorHex(0xeeeeee);
        [_tableView setCustomSeparatorInset:UIEdgeInsetsZero];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通知";
    [self.view addSubview:self.tableView];
    [self getNoticeData];
}

- (void)getNoticeData {
    NoticeModel *model = [[NoticeModel alloc]init];
    [self.datasource addObject:model];
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeCell *cell = [NoticeCell cellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoticeDetailViewController *vc = [[NoticeDetailViewController alloc]init];
    [self hideBottomBarPush:vc];
}

#pragma mark - DZNEmptyDataSetDelegate, DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"暂无通知"];
    title.color = UIColorHex(666666);
    title.font = SYSTEM_FONT(20);
    return title;
}


@end
