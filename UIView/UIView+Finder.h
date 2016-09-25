//
//  UIView+Finder.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/15.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Finder)

/**
 *  获取当前view的反应链上的最接近的viewController
 */
- (UIViewController *)findSuperVC;

/**
 *  获取当前view的反应链上的最接近的viewClass
 */
- (UIView *)findCustomView:(Class)viewClass;

/**
 *  获取当前view中p坐标点所在的最top的子view
 */
- (UIView *)findTouchView:(CGPoint)p;

@end
