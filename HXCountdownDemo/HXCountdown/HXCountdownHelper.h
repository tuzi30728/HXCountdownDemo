//
//  HXCountdownHelper.h
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HXCountdownModel.h"

typedef void(^HXCountdownHelperCallBack)(NSMutableArray *lessTimeArray);

@interface HXCountdownHelper : NSObject

@property (nonatomic,strong) NSMutableArray *lessTimeArray;
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,copy) HXCountdownHelperCallBack callBack;

- (instancetype)initWithLessTimeArray:(NSMutableArray *)lessTimeArray;

- (void)startTimer;

@end
