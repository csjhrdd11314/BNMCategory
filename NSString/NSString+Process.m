//
//  NSString+Process.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSString+Process.h"

@implementation NSString (Process)

-(NSString *)stringByTrimToLength:(int)length withPrefix:(NSString *)prefix withSuffix:(NSString *)suffix
{
    NSString *text = self;
    if( prefix.length + self.length + suffix.length > length ) {
        NSInteger trimToLength = length-1-prefix.length-suffix.length;
        text = [NSString stringWithFormat:@"%@…",
                [text substringWithRange:NSMakeRange(0, trimToLength)]];
    }
    return [NSString stringWithFormat:@"%@%@%@", prefix, text, suffix];
}

- (NSString *)replaceAllWhitespaceAndNewLine
{
    NSString *str = self;
    //该句仅仅除掉首尾的空白字符和换行字符
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

- (NSString *)firstLetter
{
    if (!self.length || self.length == 1) {
        return self;
    } else {
        return [self substringToIndex:1];
    }
}

- (NSString *)stringByEnsuringHttpPrefix
{
    if ([self hasPrefix:@"http://"]) {
        return self;
    } else {
        return [self stringByEnsuringPrefix:@"http://"];
    }
}

- (NSString *)stringByEnsuringPrefix:(NSString *)prefix
{
    if (prefix) {
        if ([self hasPrefix:prefix]) {
            return self;
        } else {
            return [prefix stringByAppendingString:self];
        }
    } else {
        return self;
    }
}

- (NSString *)stringByEnsuringSuffix:(NSString *)suffix
{
    if (suffix) {
        if ([self hasSuffix:suffix]) {
            return self;
        } else {
            return [self stringByAppendingString:suffix];
        }
    } else {
        return self;
    }
}

- (NSString *)stringByEnsuringNoPrefix:(NSString *)prefix
{
    if (prefix) {
        NSString *result = [self copy];
        while ([result hasPrefix:prefix]) {
            result = [result substringFromIndex:prefix.length];
        }
        return result;
    } else {
        return self;
    }
}

- (NSString *)stringByEnsuringNoSuffix:(NSString *)suffix
{
    if (suffix) {
        NSString *result = [self copy];
        while ([result hasSuffix:suffix]) {
            result = [result substringToIndex:result.length - suffix.length];
        }
        return result;
    } else {
        return self;
    }
}

@end
