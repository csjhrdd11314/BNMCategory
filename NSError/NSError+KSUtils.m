//
//  NSError+KSUtils.m
//  BaiDuTicket
//
//  Created by baidu on 15/10/20.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import "NSError+KSUtils.h"

static NSString *const REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY = @"error_code";
static NSString *const REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY = @"error_msg";

static NSString *const ErrorDomain = @"com.baidu.csj";

static NSString *const REQUEST_ERROR_DESC_NONE = @"无描述";
static NSString *const REQUEST_ERROR_DESC_PARAM_INVALID = @"参数不合法";
static NSString *const REQUEST_ERROR_DESC_SERVER_RESPONSE_INVALID = @"请求返回JSON不合法";
static NSString *const REQUEST_ERROR_DESC_BDUSS_INVALID = @"Invalid user bduss";

@implementation NSError (KSUtils)

+ (BOOL)isRequestFailure:(id)response
{
    if (![response isKindOfClass:[NSDictionary class]]) return NO;
    
    NSDictionary *dict = (NSDictionary *)response;
    NSArray *allKeys = [dict allKeys];
    
    if ([allKeys containsObject:REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY] ||
        [allKeys containsObject:REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY])
        return YES;
    else
        return NO;
}

+ (NSString *)errorCodeDesc:(NSInteger)code
{
    NSString *desc = REQUEST_ERROR_DESC_NONE;
    switch (code) {
        case REQUEST_ERROR_PARAM_INVALID: {
            desc = REQUEST_ERROR_DESC_PARAM_INVALID;
            break;
        }
        case REQUEST_ERROR_SERVER_RESPONSE_INVALID: {
            desc = REQUEST_ERROR_DESC_SERVER_RESPONSE_INVALID;
            break;
        }
        default:
            break;
    }
    
    return desc;
}

+ (NSError *)errorResponse:(id)response
{
    NSDictionary *dict = (NSDictionary *)response;
    NSNumber *code = dict[REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY];
    NSString *desc = dict[REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY];
    
    NSDictionary *descDict = nil;
    if (desc != nil) descDict = @{NSLocalizedDescriptionKey: desc};
    
    return [[NSError alloc] initWithDomain:ErrorDomain code:[code integerValue] userInfo:descDict];
}

+ (NSError *)errorCode:(NSInteger)code
{
    return [[NSError alloc] initWithDomain:ErrorDomain code:REQUEST_ERROR_PARAM_INVALID userInfo:@{NSLocalizedDescriptionKey: [self errorCodeDesc:code]}];
}

@end
