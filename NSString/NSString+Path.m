//
//  NSString+Path.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSString+Path.h"
#import <CommonCrypto/CommonDigest.h>

static NSString *const MyDocumentPath = @"myDocument";
static NSString *const MyCachePath = @"myCache";

@implementation NSString (Path)

- (BOOL)fileExist
{
    return [[NSFileManager defaultManager] fileExistsAtPath:self];
}

- (BOOL)createDir
{
    return [[NSFileManager defaultManager] createDirectoryAtPath:self withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (NSString *)appCacheDir
{
    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:[MyCachePath md5Str]];
    if (![cachesDir fileExist]) [cachesDir createDir];
    return cachesDir;
}

- (NSString *)appendCacheDir
{
    return [[self.class appCacheDir] stringByAppendingPathComponent:self];
}

- (NSURL *)appendCacheURL
{
    return [NSURL fileURLWithPath:[self appendCacheDir]];
}

+ (NSString *)appDocumentDir
{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:[MyDocumentPath md5Str]];
    if ([docDir fileExist]) [docDir createDir];
    return docDir;
}

- (NSString *)appendDocumentDir
{
    return [[self.class appDocumentDir] stringByAppendingPathComponent:self];
}

- (NSURL *)appendDocumentURL
{
    return [NSURL fileURLWithPath:[self appendDocumentDir]];
}

- (NSString *)md5Str
{
    const char *str = [self UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    return filename;
}

@end
