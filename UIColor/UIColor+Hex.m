//
//  UIColor+Hex.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/18.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

#pragma mark - public methods

+ (UIColor *)colorWithHexInteger:(NSInteger)hexInteger
{
    CGFloat red, green, blue, alpha;
    red = ((CGFloat)((hexInteger >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hexInteger >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hexInteger >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hexInteger > 0xFFFFFF ? ((CGFloat)((hexInteger >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1.0;
    
    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexString: (NSString *) hexString
{
    NSString *colorString = [self cleanHexString:hexString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            return [UIColor clearColor];
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}


#pragma mark - private methods

+ (NSString *)cleanHexString:(NSString *)rawString
{
    //删除字符串中的空格
    NSString *hexString_step1 = [[rawString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    NSString *hexString_step2 = [[hexString_step1 stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    NSString *resultStr = [[hexString_step2 stringByReplacingOccurrencesOfString: @"0X" withString: @""] uppercaseString];
    return resultStr;
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


@end
