//
//  NSObject+NSArray.m
//  Pods
//
//  Created by chenshuijin on 16/1/26.
//
//

#import "NSObject+NSArray.h"
#import <objc/runtime.h>

@implementation NSObject (NSArray)

- (NSMutableArray *)getPropertiesArray
{
   return [self getPropertiesArrayFromClass:[self class]];
}

- (NSMutableArray *)getPropertiesArrayFromClass:(Class)class
{
    NSMutableArray *array = [NSMutableArray array];
    unsigned int propCount, i;
    objc_property_t *properties = class_copyPropertyList(class, &propCount);
    for (i = 0; i < propCount; i++) {
        objc_property_t prop = properties[i];
        const char *propName = property_getName(prop);
        if (propName) {
            NSString *name = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
            [array addObject:name];
        }
    }
    free(properties);
    return array;
}

@end
