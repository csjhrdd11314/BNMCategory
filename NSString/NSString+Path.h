//
//  NSString+Path.h
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

- (BOOL)fileExist;
- (BOOL)createDir;

+ (NSString *)appDocumentDir;
- (NSString *)appendDocumentDir;
- (NSURL *)appendDocumentURL;

+ (NSString *)appCacheDir;
- (NSString *)appendCacheDir;
- (NSURL *)appendCacheURL;

- (NSString *)md5Str;

@end
