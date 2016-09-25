//
//  UIColor+myCostom.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/18.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "UIColor+myCostom.h"
#import "UIColor+Hex.h"

#define COLOR_HexInteger(NAME, Hex) + (instancetype)NAME {\
static UIColor *_NAME;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_NAME = [UIColor colorWithHexInteger:Hex];\
});\
return _NAME;\
}\

#define COLOR_HexString(NAME, Hex) + (instancetype)NAME {\
static UIColor *_NAME;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_NAME = [UIColor colorWithHexString:Hex];\
});\
return _NAME;\
}\

@implementation UIColor (myCostom)

//实际项目中选择一种统一即可
COLOR_HexInteger(myFavoriteColor, 0x3235fa)
COLOR_HexString(myLeastFavoriteColor,@"#9823a711")

@end
