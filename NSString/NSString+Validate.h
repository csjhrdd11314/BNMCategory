//
//  NSString+Validate.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/25.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

- (BOOL)isValidEmail;
- (BOOL)isValidMobile;
- (BOOL)isValidPassword;

@end
