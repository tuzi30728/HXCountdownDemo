//
//  HXProductionCell.h
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Extension.h"

@class HXProductionModel;

@interface HXProductionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productionImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *beginTImeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTImeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lessTimeLabel;

@property (nonatomic,strong) HXProductionModel *model;

@end
