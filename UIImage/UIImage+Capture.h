//
//  UIImage+Capture.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Capture)

/**
 *  截图view的内容生成对应的image
 */
+ (UIImage *)capturedImageFromView:(UIView *)view;

@end
