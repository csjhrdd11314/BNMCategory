//
//  NSString+Size.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Size)

/**
 *  根据指定font和最大size，返回字符串文本的size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  根据指定font和size，返回字符串文本的高度
 */
- (CGFloat)heightWithSize:(CGSize)size textFont:(UIFont *)textFont;

/**
 *  根据指定font和宽度，返回字符串文本的高度
 */
- (CGFloat)heightWithWidth:(CGFloat)width textFont:(UIFont *)textFont;

/**
 *  根据指定font，返回字符串文本的宽度
 */
- (CGFloat)widthFont:(UIFont *)textFont;

@end
