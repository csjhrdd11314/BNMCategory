//
//  NSDictionary+Json.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/9/18.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "NSDictionary+Json.h"
#import <Foundation/NSJSONSerialization.h>

@implementation NSDictionary (Json)

- (NSString*)JSONString
{
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (error != nil) {
        NSLog(@"NSDictionary JSONString error: %@", [error localizedDescription]);
        return nil;
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end
