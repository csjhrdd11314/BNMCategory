//
//  NSString+Check.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSString+Check.h"

#ifdef DEBUG
#define CSJLog(fmt, ...) NSLog((@"\n%s [Line %d] \n==> " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define CSJLog(...)
#endif

@implementation NSString (Check)

#pragma mark - public methods

+ (BOOL)isEmpty:(NSString *)string
{
    return (!string || ![self trim:string].length);
}

+ (BOOL)isUInteger:(NSString *)string
{
    if ([self isEmpty:string])
        return NO;
    string = [self trim:string];
    return [string isMatchesRegExp:@"^\\d+$"];
}

- (BOOL)isMatchesRegExp:(NSString *)regExp
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regExp
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if (error) {
        CSJLog("Error: %@", error);
        return NO;
    }
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
                                                        options:0
                                                          range:NSMakeRange(0, self.length)];
    return numberOfMatches;
}


#pragma mark - private methods

+ (NSString *)trim:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
