//
//  UIImage+Size.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/16.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Size)

/**
 *  截取部分图像
 *
 *  @param frame 截取区域
 *
 *  @return 截取后的Image
 */
-(UIImage*)croppedImageAtFrame:(CGRect)frame;

/**
 *  等比例缩放
 *
 *  @param size 目标大小
 *
 *  @return 缩放后的Image
 */
-(UIImage*)scaledImageWithSize:(CGSize)size;

@end
