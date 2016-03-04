//
//  NSObject+Extension.h
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

- (NSString *)lessSecondsToDay:(NSInteger)seconds;

- (NSString *)dateWithSeconds:(NSTimeInterval)seconds;

@end
