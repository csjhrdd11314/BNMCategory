//
//  UIView+Draw.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/25.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "UIView+Draw.h"

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@implementation UIView (Draw)

- (void)drawOnePixelLineInRect:(CGRect)rect
                  linePosition:(LinePosition)linePosition
                         color:(UIColor *)color
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    if (color) {
        [color setStroke];
    }else {
        [[UIColor lightGrayColor] setStroke];
    }
    
    CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
    
    switch (linePosition) {
        case LinePositionUp:
            CGContextMoveToPoint(context, 0, SINGLE_LINE_ADJUST_OFFSET);
            CGContextAddLineToPoint(context, rect.size.width, SINGLE_LINE_ADJUST_OFFSET);
            break;
        case LinePositionDown:
            CGContextMoveToPoint(context, 0, rect.size.height - SINGLE_LINE_ADJUST_OFFSET );
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height - SINGLE_LINE_ADJUST_OFFSET);
            break;
        case LinePositionLeft:
            CGContextMoveToPoint(context,  SINGLE_LINE_ADJUST_OFFSET, 0);
            CGContextAddLineToPoint(context, SINGLE_LINE_ADJUST_OFFSET, rect.size.height);
            break;
        case LinePositionRight:
            CGContextMoveToPoint(context,rect.size.width - SINGLE_LINE_ADJUST_OFFSET, 0);
            CGContextAddLineToPoint(context, rect.size.width - SINGLE_LINE_ADJUST_OFFSET, rect.size.height);
            break;
            
        default:
            break;
    }
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}


@end
