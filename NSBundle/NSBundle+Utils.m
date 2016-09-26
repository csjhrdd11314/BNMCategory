//
//  NSBundle+Utils.m
//  O2OZone
//
//  Created by chenshuijin on 15/11/17.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "NSBundle+Utils.h"

@implementation NSBundle (Utils)

+ (NSBundle *)bundleWithName:(NSString *)bundleName
{
    return [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"]];
}

@end
