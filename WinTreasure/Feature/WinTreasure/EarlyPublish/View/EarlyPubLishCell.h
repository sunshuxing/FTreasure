//
//  EarlyPubLishCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EarlyPublishModel.h"

@interface EarlyPubLishCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, strong) EarlyPublishModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *winnerImgView;

@property (weak, nonatomic) IBOutlet UILabel *periodLabel;

@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@property (weak, nonatomic) IBOutlet UILabel *ipLabel;

@property (weak, nonatomic) IBOutlet UILabel *luckyNoLabel;

@property (weak, nonatomic) IBOutlet UILabel *participateLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end
