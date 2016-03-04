//
//  ViewController.m
//  HXCountdownDemo
//
//  Created by HongXiangWen on 16/3/4.
//  Copyright © 2016年 WHX. All rights reserved.
//

#import "ViewController.h"
#import "HXProductionCell.h"
#import "HXProductionModel.h"
#import "HXCountdownHelper.h"

static NSString *cellIdentifier = @"productionCell";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *productionArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupCountdownHelper];
}

- (void)setupCountdownHelper
{
    NSMutableArray *countDownArray = [NSMutableArray array];
    for (int i = 0; i < self.productionArray.count; i++) {
        HXProductionModel *model = self.productionArray[i];
        if (model.canCountDown) {
            NSInteger time = (NSInteger)[[NSDate date] timeIntervalSince1970];
            HXCountdownModel *countdownModel = [[HXCountdownModel alloc] init];
            countdownModel.lessTime = model.endTime - time;
            countdownModel.index = i;
            [countDownArray addObject:countdownModel];
        }
    }
    HXCountdownHelper *helper = [[HXCountdownHelper alloc] initWithLessTimeArray:countDownArray];
    [helper startTimer];
    helper.callBack = ^(NSMutableArray *lessTimeArray) {
        for (int i = 0; i < lessTimeArray.count; i ++) {
            HXCountdownModel *countdownModel = lessTimeArray[i];
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:countdownModel.index inSection:0];
            HXProductionCell *cell = (HXProductionCell *)[self.tableView cellForRowAtIndexPath:indexPath];
            
            HXProductionModel *model = self.productionArray[indexPath.row];
            model.lessTime = countdownModel.lessTime;
            
            cell.lessTimeLabel.text = [self lessSecondsToDay:countdownModel.lessTime];
        }
    };
}

- (NSMutableArray *)productionArray
{
    if (!_productionArray) {
        _productionArray = [NSMutableArray array];
        NSInteger time = (NSInteger)[[NSDate date] timeIntervalSince1970];
        for (int i = 0; i < 16; i ++) {
            HXProductionModel *model = [[HXProductionModel alloc] init];
            model.beginTime = time;
            model.endTime = time + arc4random()%1000;
            model.lessTime = model.endTime - model.beginTime;
            model.imgName = [NSString stringWithFormat:@"商品%d.jpg",i+1];
            model.proName = @"手机大促销";
            model.canCountDown = YES;
            [_productionArray addObject:model];
        }
    }
    return _productionArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.productionArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HXProductionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HXProductionCell" owner:nil options:nil] firstObject];
    }
    HXProductionModel *model = self.productionArray[indexPath.row];
    cell.model = model;
    return cell;
}


@end
