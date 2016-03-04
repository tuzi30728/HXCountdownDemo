//
//  NSObject+Extension.m
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

- (NSString *)lessSecondsToDay:(NSInteger)seconds
{
    if (seconds < 0) {
        return @"活动已结束";
    }
    
    NSUInteger day  = (NSUInteger)seconds/(24*3600);
    NSUInteger hour = (NSUInteger)(seconds%(24*3600))/3600;
    NSUInteger min  = (NSUInteger)(seconds%(3600))/60;
    NSUInteger second = (NSUInteger)(seconds%60);
    
    NSString *timeString = [NSString stringWithFormat:@"%lu日%lu小时%lu分钟%lu秒",day,hour,min,second];
    
    return timeString;
}


- (NSString *)dateWithSeconds:(NSTimeInterval)seconds
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSString *timeString = [formatter stringFromDate:date];
    
    return timeString;
}

@end
