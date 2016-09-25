//
//  UIColor+Hex.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/18.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 *  从十六进制整数串获取颜色，
 *
 *  @param hexInteger 支持0XAARRGGBB和0XRRGGBB两种格式
 *
 */
+ (UIColor *)colorWithHexInteger:(NSInteger)hexInteger;


/**
 *  从十六进制字符串获取颜色，
 *
 *  @param hexString 支持@"RRGGBB"和@"AARRGGBB"两种格式
 *
 */
+ (UIColor *)colorWithHexString: (NSString *) hexString;

@end
