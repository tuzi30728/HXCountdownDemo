//
//  HXProductionCell.m
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import "HXProductionCell.h"
#import "HXProductionModel.h"

@implementation HXProductionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(HXProductionModel *)model
{
    _model = model;
    
    self.productionImageView.image = [UIImage imageNamed:_model.imgName];
    self.nameLabel.text = _model.proName;
    self.beginTImeLabel.text = [NSString stringWithFormat:@"开始时间：%@",[self dateWithSeconds:_model.beginTime]];
    self.endTImeLabel.text =  [NSString stringWithFormat:@"结束时间：%@",[self dateWithSeconds:_model.endTime]];
    self.lessTimeLabel.text = [self lessSecondsToDay:_model.lessTime];
}

@end
