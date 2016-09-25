//
//  NSObject+Utils.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/19.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSObject+Utils.h"
#import <objc/runtime.h>
#import "NSString+Path.h"

#ifdef DEBUG
#define CSJAssert(condition, desc, ...) NSAssert(condition, (@"\n%s [Line %d] \n==> " desc), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define CSJAssert(condition, desc, ...)
#endif

static NSString *const documentArchiveCache  =  @"documentArchiveCache";

@implementation NSObject (Utils)

#pragma mark - 判断当前对象是否是有实际内容的

- (BOOL)isValid
{
    if ([self isKindOfClass:[NSNull class]]) return NO;
    if ([self isKindOfClass:[NSArray class]]) return [(NSArray *)self count];
    if ([self isKindOfClass:[NSDictionary class]]) return [(NSDictionary *)self count];
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self isEqualToString:@"(null)"]) return NO;
        else return [(NSString *)self length];
    }
    return YES;
}


#pragma mark - json解析

- (id)objectEncode
{
    CSJAssert([self isValid], @"ERROR: Object Is Invalid: %@!", self);
    NSData  *jsonData = nil;
    if ([NSJSONSerialization isValidJSONObject:self])
        jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return (jsonData == nil) ? self : [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (id)jsonObject
{
    CSJAssert([self isValid], @"ERROR: Json String Is Invalid: %@!", self);
    return [NSJSONSerialization JSONObjectWithData:[(NSString *)self dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
}


#pragma mark - 数据存档与读取

- (NSString *)setupFilePath:(NSString *)fileName
{
    NSString *filePath = [documentArchiveCache appendDocumentDir];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return [filePath stringByAppendingPathComponent:fileName];
}

- (BOOL)archiveToFileName:(NSString *)fileName
{
    return [self archiveToFilePath:[self setupFilePath:fileName]];
}

- (id)unArchiveFromFileName
{
    return [[self setupFilePath:(NSString *)self] unArchiveFromFilePath];
}

- (BOOL)archiveToFilePath:(NSString *)filePath
{
    return [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

- (id)unArchiveFromFilePath
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:(NSString *)self];
}


#pragma mark - 动态添加和删除对象的实例变量

- (void)addProperty:(NSString *)property value:(id)value
{
    objc_setAssociatedObject(self, NSSelectorFromString(property), value, OBJC_ASSOCIATION_RETAIN);
}

- (id)getValueProperty:(NSString *)property
{
    return objc_getAssociatedObject(self, NSSelectorFromString(property));
}

- (void)removeProperty:(NSString *)property
{
    objc_setAssociatedObject(self, NSSelectorFromString(property), nil, OBJC_ASSOCIATION_RETAIN);
}

- (void)removeAllProperty
{
    objc_removeAssociatedObjects(self);
}


#pragma mark - 执行带多参数的方法

- (void)performSelector:(SEL)sel params:(NSArray *)params
{
    NSMethodSignature *sig = [[self class] instanceMethodSignatureForSelector:sel];
    NSInvocation *call = [NSInvocation invocationWithMethodSignature:sig];
    call.target = self;
    call.selector = sel;
    
    for (int i = 0; i < params.count; i++) {
        id p = params[i];
        [call setArgument:&p atIndex:(i + 2)];
    }
    
    [call invoke];
}

@end
