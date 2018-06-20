//
//  ViewController.m
//  YCFDatePicker
//
//  Created by 岳昌锋 on 2018/6/19.
//  Copyright © 2018年 岳昌锋. All rights reserved.
//

#import "ViewController.h"

#import "YCFDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YCFDatePicker *dp = [[YCFDatePicker alloc] init];
    dp.isCanAutorotate = YES;
    dp.typeDatePicker = YCFDatePickerType_DateAndTime;
    [dp showWithSourceVC:self completion:^{
        
    }];
}

-(IBAction)action1:(id)sender {
    YCFDatePicker *dp = [[YCFDatePicker alloc] init];
    dp.isCanAutorotate = YES;
    dp.typeDatePicker = YCFDatePickerType_Date;
    [dp showWithSourceVC:self completion:^{
        
    }];
}

-(IBAction)action2:(id)sender {
    YCFDatePicker *dp = [[YCFDatePicker alloc] init];
    dp.isCanAutorotate = YES;
    dp.normalColorCancelButton = [UIColor orangeColor];
    dp.dateMax = [NSDate date];
    dp.typeDatePicker = YCFDatePickerType_DateAndTime;
    [dp showWithSourceVC:self completion:^{
        
    }];
}

-(IBAction)action3:(id)sender {
    YCFDatePicker *dp = [[YCFDatePicker alloc] init];
    dp.isCanAutorotate = YES;
    dp.normalColorSureButton = [UIColor greenColor];
    dp.dateMin = [NSDate date];
    dp.typeDatePicker = YCFDatePickerType_DateAndTime;
    [dp showWithSourceVC:self completion:^{
        
    }];
}

-(IBAction)action4:(id)sender {
    YCFDatePicker *dp = [[YCFDatePicker alloc] init];
    dp.isCanAutorotate = YES;
    dp.typeDatePicker = YCFDatePickerType_DateAndTime;
    [dp showWithSourceVC:self completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
