//
//  UIImage+Blur.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/16.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Blur)

/**
 *  获取模糊处理后的图片
 */
- (UIImage *)blurImage;

/**
 *  获取指定图片为遮罩并模糊处理后的图片
 *
 *  @param 遮罩图片
 *
 */
- (UIImage *)blurImageWithMask:(UIImage *)maskImage;

/**
 *  获取指定模糊程度的处理后的图片
 *
 *  @param 模糊程度，在一定范围内（不要大于45）数值越大，模糊效果越好
 *
 */
- (UIImage *)blurImageWithRadius:(CGFloat)radius;

@end
