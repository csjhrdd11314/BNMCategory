//
//  NSString+Check.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)

/**
 *  判断字符串是否为空
 */
+ (BOOL)isEmpty:(NSString *)string;

/**
 *  判断字符串内容是否是纯数字
 */
+ (BOOL)isUInteger:(NSString *)string;

/**
 *  判断字符串是否符合指定的正则表达
 */
- (BOOL)isMatchesRegExp:(NSString *)regExp;

@end
