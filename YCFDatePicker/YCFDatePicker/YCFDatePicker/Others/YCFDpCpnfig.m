//
//  YCFDpCpnfig.m
//  Pods-YCFDatePicker_Example
//
//  Created by 岳昌锋 on 2018/6/19.
//

#import "YCFDpCpnfig.h"

@implementation YCFDpCpnfig

+ (UIColor *)ycf_getDefaultTitleColor {
    CGFloat value = 130;
    return [UIColor colorWithRed:(value / 255.0) green:(value / 255.0) blue:(value / 255.0) alpha:1.0];
}

+ (UIColor *)ycf_getDefaultLineColor {
    return [UIColor colorWithRed:(210 / 255.0) green:(197 / 255.0) blue:(200 / 255.0) alpha:1.0];
}

+ (UIColor *)ycf_getDefaultBtnCancelColor {
    return [UIColor redColor];
}

+ (UIColor *)ycf_getDefaultBtnSureColor {
    return [UIColor darkGrayColor];
}

+ (UIFont *)ycf_getDefaultBtnFont {
    return [UIFont systemFontOfSize:16.0];
}

@end
