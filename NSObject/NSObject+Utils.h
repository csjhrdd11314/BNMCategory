//
//  NSObject+Utils.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/19.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Foundation/Foundation.h>

//依赖NSString+Path，将来如果独立出单独的pod，需要在podspect中添加依赖

@interface NSObject (Utils)

/**
 *  判断对象是否合法
 */
- (BOOL)isValid;

/**
 *  归档至Document文件夹
 *
 *  @param fileName 文件名
 *
 *  @return 归档是否成功
 */
- (BOOL)archiveToFileName:(NSString *)fileName;

/**
 *  从Document文件夹解档文件
 *
 *  @return 对象
 */
- (id)unArchiveFromFileName;

/**
 *  归档至路径
 *
 *  @param filePath 路径
 *
 *  @return 归档成功与否
 */
- (BOOL)archiveToFilePath:(NSString *)filePath;

/**
 *  从指定路径解档
 *
 *  @return 对象
 */
- (id)unArchiveFromFilePath;

/**
 *  对象序列化
 */
- (id)objectEncode;

/**
 *  对象反序列化
 */
- (id)jsonObject;

/**
 *  为对象添加属性
 *
 *  @param property 属性名
 *  @param value    属性值
 */
- (void)addProperty:(NSString *)property value:(id)value;

/**
 *  获取添加属性的值
 *
 *  @param property 属性名
 *
 */
- (id)getValueProperty:(NSString *)property;

/**
 *  移除指定的属性
 *
 *  @param property 属性名
 */
- (void)removeProperty:(NSString *)property;

/**
 *  移除所有属性
 *
 *  @param property 属性名
 */
- (void)removeAllProperty;

/**
 *  根据sel和参数生成NSInvocation并执行
 *
 *  @param params 方法包含的参数数组
 */
- (void)performSelector:(SEL)sel params:(NSArray *)params;

@end
