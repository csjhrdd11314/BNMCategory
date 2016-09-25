//
//  UIView+Finder.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/15.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "UIView+Finder.h"

@implementation UIView (Finder)


- (UIViewController *)findSuperVC
{
    __weak id responder = self;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]])
            return responder;
        responder = [responder nextResponder];
    }
    
    return nil;
}

- (UIView *)findCustomView:(Class)viewClass
{
    __weak id responder = self;
    while (responder) {
        if ([responder isKindOfClass:viewClass])
            return responder;
        responder = [responder nextResponder];
    }
    
    return nil;
}

- (UIView *)findTouchView:(CGPoint)p
{
    UIView *view = self;
    for (UIView *child in view.subviews) {
        if (CGRectContainsPoint(child.frame, p)) {
            view = child;
            if (child.subviews.count) {
                view = [child findTouchView:[child convertPoint:p fromView:self]];
            }
        }
    }
    return view;
}


@end
