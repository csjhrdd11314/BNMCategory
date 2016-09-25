//
//  NSObject+NSArray.h
//  Pods
//
//  Created by chenshuijin on 16/1/26.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (NSArray)

- (NSMutableArray *)getPropertiesArray;

- (NSMutableArray *)getPropertiesArrayFromClass:(Class)class;

@end
