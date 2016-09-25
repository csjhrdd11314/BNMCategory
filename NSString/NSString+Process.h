//
//  NSString+Process.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Process)

/**
 *  给字符串增加指定的前缀和后缀，如果最终长度超过指定的长度，则裁剪原来字符串
 */
-(NSString *)stringByTrimToLength:(int)length withPrefix:(NSString *)prefix withSuffix:(NSString *)suffix;

/**
 *  去掉换行符和空白字符
 */
- (NSString *)replaceAllWhitespaceAndNewLine;

/**
 *  获取字符串首字母
 */
- (NSString *)firstLetter;

/**
 *  保证字符串符合http格式
 */
- (NSString *)stringByEnsuringHttpPrefix;

/**
 *  保证字符串以指定的prefix开头
 */
- (NSString *)stringByEnsuringPrefix:(NSString *)prefix;

/**
 *  保证字符串以指定的suffix结尾
 */
- (NSString *)stringByEnsuringSuffix:(NSString *)suffix;

/**
 *  保证字符串的开头不出现指定prefix
 */
- (NSString *)stringByEnsuringNoPrefix:(NSString *)prefix;

/**
 *  保证字符串的结尾不出现指定suffix
 */
- (NSString *)stringByEnsuringNoSuffix:(NSString *)suffix;

@end
