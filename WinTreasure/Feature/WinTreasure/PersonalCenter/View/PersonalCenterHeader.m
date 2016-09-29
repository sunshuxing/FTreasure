//
//  PersonalCenterHeader.m
//  WinTreasure
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PersonalCenterHeader.h"

const CGFloat PersonalCenterHeaderHeight = 80.0;
const CGFloat PersonalCenterHeadImageHeight = 50.0;

@interface PersonalCenterHeader ()

/**头像
 */
@property (nonatomic, strong) UIImageView *headImgView;

/**昵称
 */
@property (nonatomic, strong) YYLabel *nameLabel;

/**ID
 */
@property (nonatomic, strong) YYLabel *IDLabel;

@end

@implementation PersonalCenterHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorHex(0xE4475A);
        self.height = PersonalCenterHeaderHeight;
        _headImgView = [UIImageView new];
        _headImgView.origin = CGPointMake((PersonalCenterHeaderHeight-PersonalCenterHeadImageHeight)/2.0, (PersonalCenterHeaderHeight-PersonalCenterHeadImageHeight)/2.0);
        _headImgView.size = CGSizeMake(PersonalCenterHeadImageHeight, PersonalCenterHeadImageHeight);
        _headImgView.image = IMAGE_NAMED(@"curry");
        [self addSubview:_headImgView];
        
        _nameLabel = [YYLabel new];
        _nameLabel.origin = CGPointMake(_headImgView.right+10, 20);
        _nameLabel.size = CGSizeMake(kScreenWidth-(_headImgView.right+10)-10, 15);
        _nameLabel.font = SYSTEM_FONT(14);
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"小锤锤";
        [self addSubview:_nameLabel];
        
        _IDLabel = [YYLabel new];
        _IDLabel.origin = CGPointMake(_headImgView.right+10, _nameLabel.bottom+5);
        _IDLabel.size = CGSizeMake(kScreenWidth-(_headImgView.right+10)-10, 15);
        _IDLabel.font = SYSTEM_FONT(13);
        _IDLabel.textColor = [UIColor whiteColor];
        _IDLabel.text = @"ID:12405855";
        [self addSubview:_IDLabel];
    }
    return self;
}

- (void)setInfoDic:(NSDictionary *)infoDic {
    _infoDic = infoDic;
    [_headImgView setImageWithURL:[NSURL URLWithString:_infoDic[@"imgUrl"]] options:YYWebImageOptionProgressive];
    _nameLabel.text = _infoDic[@"nickname"];
    _IDLabel.text = [NSString stringWithFormat:@"ID:%@",_infoDic[@"id"]];
}

+ (CGFloat)headerHeight {
    return PersonalCenterHeaderHeight;
}

@end
