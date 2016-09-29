//
//  RedBook.h
//  WinTreasure
//
//  Created by Apple on 16/6/7.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedBook : UIView

@property (nonatomic, copy) NSArray *dataArray;

- (instancetype)initWithArray:(NSArray *)array;

- (void)strokeEnd;
- (void)strokeStart;
@end
