//
//  WinTreasureModel.m
//  WinTreasure
//
//  Created by Apple on 16/6/1.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "WinTreasureModel.h"

@implementation WinTreasureModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.productImgUrl = @"http://onegoods.nosdn.127.net/goods/1093/5095bc4b3f4228b69d6b58acf67cae1c.jpg";
        self.productName = @"Apple iPhone6s Plus 128G 颜色随机";
        self.publishProgress = [NSString stringWithFormat:@"%@",@(arc4random() % 99)];
        self.isAdded = NO;
    }
    return self;
}

- (NSMutableArray *)adImgUrls {
    if (!_adImgUrls) {
        _adImgUrls = [NSMutableArray array];
    }
    return _adImgUrls;
}

- (NSMutableArray *)notices {
    if (!_notices) {
        NSArray *array = @[@"恭喜XXX获得iPhone 6s（64G）",@"恭喜王大锤获得BMW X5一台",@"恭喜王大锤获得BenZ ML520一台",@"恭喜王大妈上车!"];
        _notices = [NSMutableArray arrayWithArray:array];
    }
    return _notices;
}

@end
