//
//  ListConfirmViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/8.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "ListConfirmViewController.h"
#import "PayOrderViewController.h"
#import "SelectBonusViewController.h"
#import "SectionHeader.h"
#import "OrderCell.h"
#import "OrderView.h"
#import "ShoppingListLayout.h"
#import "SelectBonusModel.h"

@interface ListConfirmViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SectionHeader *header;
@property (nonatomic, strong) BonusSection *bonusHeader;
@property (nonatomic, assign) BOOL isProductSpreadOut; //商品列表是否展开
@property (nonatomic, assign) BOOL isBonusSpreadOut; //红包折扣是否展开

@property (nonatomic, strong) NSMutableArray *bonusData;

@end

@implementation ListConfirmViewController

- (NSMutableArray *)bonusData {
    if (!_bonusData) {
        _bonusData = [NSMutableArray array];
    }
    return _bonusData;
}

- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:({
            CGRect rect = {0,0,kScreenWidth,kScreenHeight-[OrderView height]};
            rect;
        }) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColorHex(0xECEBE8);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getBonusData];
    _isBonusSpreadOut = YES;
    self.navigationItem.title = @"确认清单";
    [self.view addSubview:self.tableView];
    
    OrderView *orderView = [[OrderView alloc]initWithFrame:({
        CGRect rect = {0,
            kScreenHeight-[OrderView height],
            kScreenWidth,
            [OrderView height]};
        rect;
    })];
    orderView.payAmout = self.productDic[@"moneySum"];
    @weakify(self);
    orderView.block = ^() {
        @strongify(self);
        PayOrderViewController *vc = [[PayOrderViewController alloc]init];
        [self hideBottomBarPush:vc];
    };
    
    [self.view addSubview:orderView];
}

- (void)getBonusData {
    for (int i=0; i<1; i++) {
        SelectBonusModel *model = [[SelectBonusModel alloc]init];
        [self.bonusData addObject:model];
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (_isProductSpreadOut) {
            return self.datasource.count+1;
        }
        return 0;
    } else if (section==2) {
        if (_isBonusSpreadOut) {
            return 1;
        }
        return 0;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            OrderIntroCell *cell = [OrderIntroCell cellWithTableView:tableView];
            return cell;
        }
        ShoppingListLayout *layout = _datasource[indexPath.row - 1];
        OrderCell *cell = [OrderCell cellWithTableView:tableView];
        cell.nameLabel.text = layout.model.name;
        return cell;
    } else {
        BonusDisacountCell *cell = [BonusDisacountCell cellWithTableView:tableView];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        if (!_header) {
            _header = [SectionHeader header];
        }
        _header.goodsSum = @(_datasource.count);
        @weakify(self);
        _header.checkDetailBlock = ^(UIButton *sender){
            @strongify(self);
            self.isProductSpreadOut = sender.selected;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        };
        return _header;
    } else if (section==1) {
        if (!_bonusHeader) {
            _bonusHeader = [BonusSection header];
        }
        _bonusHeader.bonusSum = @(_bonusData.count);
        @weakify(self);
        _bonusHeader.checkBonus = ^{
            @strongify(self);
            SelectBonusViewController *vc = [[SelectBonusViewController alloc]init];
            vc.datasource = self.bonusData;
            [self hideBottomBarPush:vc];
            vc.chooseBonus = ^(NSInteger bonusCount){
                self.isBonusSpreadOut = bonusCount == 0 ? NO : YES;
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationAutomatic];
            };
        };
        
        return _bonusHeader;
    } else if (section==2) {
        SumSection *sumHeader = [SumSection header];
        sumHeader.moneySum = self.productDic[@"moneySum"];

        return sumHeader;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return [OrderIntroCell height];
        }
        return [OrderCell height];
    } else {
        return [BonusDisacountCell height];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0||section==1||section==2) {
        return [SectionHeader height];
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}



@end
