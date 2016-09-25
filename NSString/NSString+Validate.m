//
//  NSString+Validate.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/25.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if ([emailPredicate evaluateWithObject:self]) {
        if (self.length >= 6 && self.length <= 32) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isValidMobile
{
    //手机号以1开头，共11位数字字符
    NSString *phoneRegex = @"1\\d{10}$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phonePredicate evaluateWithObject:self];
}

- (BOOL)isValidPassword
{
    //8到14位 数字字母特殊字符，不能有空格
    NSString *passwordRegex = @"[^\\s]{8,14}$";
    NSPredicate *passwordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passwordRegex];
    return [passwordPredicate evaluateWithObject:self];
}

@end
