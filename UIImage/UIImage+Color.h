//
//  UIImage+Color.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/16.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGRect)rect;

/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 */
+ (UIImage *)colorizedImageNamed:(NSString *)imageName color:(UIColor *)color;

/**
 *  将图片处理成灰色并返回
 */
- (UIImage *)grayImage;

@end
