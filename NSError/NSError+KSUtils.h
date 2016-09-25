//
//  NSError+KSUtils.h
//  BaiDuTicket
//
//  Created by baidu on 15/10/20.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpFailure)(NSError *error);
typedef void(^HttpSuccess)(NSDictionary *result);
typedef void(^ArrayResultBlock)(NSArray *items);
typedef void(^BoolResultBlock)(BOOL value);

typedef NS_ENUM(NSInteger, HTTP_TYPE) {
    HTTP_TYPE_GET,
    HTTP_TYPE_POST
};

typedef NS_ENUM(NSInteger, REQUEST_ERROR) {
    REQUEST_ERROR_PARAM_INVALID = -10000,
    REQUEST_ERROR_SERVER_RESPONSE_INVALID,
    REQUEST_ERROR_BDUSS_INVALID = 121,
    REQUEST_ERROR_USER_DETAIL_NOT_FOUND = 157114
};

@interface NSError (KSUtils)

+ (BOOL)isRequestFailure:(id)response;
+ (NSError *)errorResponse:(id)response;
+ (NSError *)errorCode:(NSInteger)code;

@end
