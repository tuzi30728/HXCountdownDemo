//
//  HXCountdownHelper.m
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import "HXCountdownHelper.h"

@implementation HXCountdownHelper

- (instancetype)initWithLessTimeArray:(NSMutableArray *)lessTimeArray
{
    self = [super init];
    if (self) {
        self.lessTimeArray = lessTimeArray;
    }
    return self;
}

- (void)startTimer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(refreshLessTime) userInfo:nil repeats:YES];
        //如果不添加下面这条语句，在UITableView拖动的时候，会阻塞定时器的调用
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    }
}

- (void)refreshLessTime
{
    for (int i = 0; i < self.lessTimeArray.count; i++) {
        HXCountdownModel *countdownModel = self.lessTimeArray[i];
        countdownModel.lessTime --;
    }
    if (self.callBack) {
        self.callBack(self.lessTimeArray);
    }
}


@end
