//
//  TSProgressView.h
//  WinTreasure
//
//  Created by Apple on 16/6/2.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSProgressView : UIView

@property (nonatomic, assign) CGFloat progress; // 0 - 100

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setup;
@end
