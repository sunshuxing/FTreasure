//
//  WinnerInfoCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/27.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WinnerInfoModel.h"
#import "AddressModel.h"

@protocol WinnerInfoCellDelegate;

@interface WinnerInfoCell : UITableViewCell

@property (nonatomic, strong) AddressModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UIButton *prizeButton;

@property (weak, nonatomic) id<WinnerInfoCellDelegate>delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end

@protocol WinnerInfoCellDelegate <NSObject>

@optional
/**点击编辑
 */
- (void)winnerInfoCell:(WinnerInfoCell *)cell editButtonClickedAtIndexPath:(NSIndexPath *)indexPath;

/**点击删除
 */
- (void)winnerInfoCell:(WinnerInfoCell *)cell deleteButtonClickedAtIndexPath:(NSIndexPath *)indexPath;

/**点击领奖
 */
- (void)winnerInfoCell:(WinnerInfoCell *)cell prizeButtonClickedAtIndexPath:(NSIndexPath *)indexPath;

@end
