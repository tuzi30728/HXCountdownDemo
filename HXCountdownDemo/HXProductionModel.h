//
//  HXProductionModel.h
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXProductionModel : NSObject

@property (nonatomic,strong) NSString *imgName;
@property (nonatomic,strong) NSString *proName;
@property (nonatomic,assign) NSInteger beginTime;
@property (nonatomic,assign) NSInteger endTime;
@property (nonatomic,assign) NSInteger lessTime;

@property (nonatomic,assign) BOOL canCountDown;// 设置是否倒计时

@end
