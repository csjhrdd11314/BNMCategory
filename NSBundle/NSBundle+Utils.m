//
//  NSBundle+Utils.m
//  O2OZone
//
//  Created by baidu on 15/11/17.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "NSBundle+Utils.h"

NSString *const SDKBundle = @"myBundle";

@implementation NSBundle (Utils)

+ (NSBundle *)sdkBundle
{
    return [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:SDKBundle ofType:@"bundle"]];
}

@end
