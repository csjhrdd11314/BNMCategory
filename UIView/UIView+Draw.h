//
//  UIView+Draw.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/25.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,  LinePosition) {
    LinePositionUp,
    LinePositionDown,
    LinePositionLeft,
    LinePositionRight
};

@interface UIView (Draw)

/**
 *  使用方式:在自定义view的drawRect中调用该方法即可
 */
- (void)drawOnePixelLineInRect:(CGRect)rect
                  linePosition:(LinePosition)linePosition
                         color:(UIColor *)color;

@end
