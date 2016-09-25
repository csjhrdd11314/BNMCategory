//
//  UIImage+WaterMark.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/16.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "UIImage+WaterMark.h"

@implementation UIImage (WaterMark)

#pragma mark - 文字水印
- (UIImage *) imageWithStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font
{
    UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];//原图
    [color set];//文字颜色
    NSDictionary *attributes = @{NSFontAttributeName: font};
    [markString drawAtPoint:point withAttributes:attributes];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

#pragma mark - 图片水印
- (UIImage *) imageWithWaterMaskImage:(UIImage*)waterMaskImage inRect:(CGRect)rect
{
    UIImage *resultingImage = [self imageWithWaterMaskImage:waterMaskImage inRect:rect alpha:1.0f];
    return resultingImage;
}

#pragma mark - 半透明图片水印
-(UIImage *)imageWithWaterMaskImage:(UIImage *)waterMaskImage inRect:(CGRect)rect alpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [waterMaskImage drawInRect:rect blendMode:kCGBlendModeNormal alpha:alpha];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

@end
