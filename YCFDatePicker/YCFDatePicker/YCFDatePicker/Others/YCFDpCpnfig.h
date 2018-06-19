//
//  YCFDpCpnfig.h
//  Pods-YCFDatePicker_Example
//
//  Created by 岳昌锋 on 2018/6/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YCFDpCpnfig : NSObject

/**
 标题 默认颜色
 
 @return 颜色
 */
+ (UIColor *)ycf_getDefaultTitleColor;

/**
 分割线 默认颜色
 
 @return 颜色
 */
+ (UIColor *)ycf_getDefaultLineColor;

/**
 取消按钮 默认颜色
 
 @return 颜色
 */
+ (UIColor *)ycf_getDefaultBtnCancelColor;

/**
 确定按钮 默认颜色
 
 @return 颜色
 */
+ (UIColor *)ycf_getDefaultBtnSureColor;

/**
 获取按钮 默认字体大小
 
 @return 字体大小
 */
+ (UIFont *)ycf_getDefaultBtnFont;

@end
