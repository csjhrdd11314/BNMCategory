//
//  NSString+Size.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGFloat)heightWithSize:(CGSize)size textFont:(UIFont *)textFont
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: textFont} context:nil].size.height;
}

- (CGFloat)heightWithWidth:(CGFloat)width textFont:(UIFont *)textFont
{
    return [self heightWithSize:CGSizeMake(width, MAXFLOAT) textFont:textFont];
}

- (CGFloat)widthFont:(UIFont *)textFont
{
    return [self sizeWithAttributes:@{NSFontAttributeName: textFont}].width;
}

@end
