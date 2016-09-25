//
//  UIImage+WaterMark.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/16.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WaterMark)

/**
 *  添加文字水印
 */
- (UIImage *) imageWithStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

/**
 *  添加图片水印
 */
- (UIImage *) imageWithWaterMaskImage:(UIImage*)waterMaskImage inRect:(CGRect)rect;

/**
 *  添加半透明图片水印
 */
- (UIImage *)imageWithWaterMaskImage:(UIImage *)waterMaskImage inRect:(CGRect)rect alpha:(CGFloat)alpha;

@end
