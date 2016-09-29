//
//  TopUpCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/17.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopUpCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *payWayLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UIButton *selecedButton;

@property (copy, nonatomic) NSIndexPath *indexPath;

+ (instancetype)cellWithTableView:(UITableView *)tableview;



@end
