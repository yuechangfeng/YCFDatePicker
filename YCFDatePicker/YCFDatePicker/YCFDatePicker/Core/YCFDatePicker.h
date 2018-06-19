//
//  YCFDpCpnfig.h
//  Pods-YCFDatePicker_Example
//
//  Created by 岳昌锋 on 2018/6/19.
//

#import <UIKit/UIKit.h>
@class YCFDatePicker;

typedef void(^BlockDatePicker)(NSDate *date);

typedef NS_ENUM(NSUInteger, YCFDatePickerType) {
    YCFDatePickerType_Date,
    YCFDatePickerType_Time,
    YCFDatePickerType_DateAndTime,
};

@protocol YCFDatePickerDelegate <NSObject>

/**
 选择日期
 
 @param datePicker 日期选择datePicker
 @param date 选择的日期
 */
- (void)cdcvDateChooseView:(YCFDatePicker *)datePicker chooseDate:(NSDate *)date;

@end


@interface YCFDatePicker : UIViewController

/**
 时间弹窗的代理
 */
@property (nonatomic, assign) id<YCFDatePickerDelegate> delegate;

/**
 时间弹窗的block
 */
@property (nonatomic, copy) BlockDatePicker blockChooseDate;

/**
 时间选择器的样式
 默认:DateAndTime
 */
@property (nonatomic, assign) YCFDatePickerType typeDatePicker;

/**
 时间选择器的日期
 默认:
 */
@property (nonatomic, strong) NSDate *datePickerCurrentDate;

/**
 时间选择器 可选的最大时间
 */
@property (nonatomic, strong) NSDate *dateMax;

/**
 时间选择器 可选的最小时间
 */
@property (nonatomic, strong) NSDate *dateMin;

/**
 是否可以旋转
 默认: no
 */
@property (nonatomic, assign) BOOL isCanAutorotate;

/**
 是否显示取消/确定按钮
 默认:显示
 */
@property (nonatomic, assign) BOOL isHasCancelAndSureButton;

/**
 取消按钮通常颜色
 默认:红色
 */
@property (nonatomic, strong) UIColor *normalColorCancelButton;

/**
 确定按钮通常颜色
 默认:
 */
@property (nonatomic, strong) UIColor *normalColorSureButton;

/**
 按钮字体大小
 默认: 16号
 */
@property (nonatomic, strong) UIFont *fontButton;

/**
 显示弹窗
 
 @param sourceVC 源 vc
 @param completion 完成
 */
- (void)showWithSourceVC:(UIViewController *)sourceVC completion:(void (^)(void))completion;

@end
