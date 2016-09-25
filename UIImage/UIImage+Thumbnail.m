//
//  UIImage+Thumbnail.m
//  MyAwesomeApp
//
//  Created by chenshuijin on 16/8/21.
//  Copyright © 2016年 csj. All rights reserved.
//

#import "UIImage+Thumbnail.h"

#define kScreenSize                         [UIScreen mainScreen].bounds.size
#define kThumbnailImageDefaultWidth     (kScreenSize.width / 3)
#define kThumbnailImageDefaultHeight    150.f

@implementation UIImage (Thumbnail)

- (UIImage *)thumbnailImage
{
    CGSize originalSize = self.size;
    CGSize thumbnailSize = CGSizeZero;
    
    if (originalSize.width > originalSize.height) {
        if (originalSize.width > kScreenSize.width) {
            thumbnailSize.width = kThumbnailImageDefaultHeight;
        }else if (originalSize.width < kThumbnailImageDefaultWidth) {
            thumbnailSize = originalSize;
        }else {
            thumbnailSize.width = kThumbnailImageDefaultWidth;
        }
        thumbnailSize.height = originalSize.height * (thumbnailSize.width / originalSize.width);
    }else {
        if (originalSize.height > kScreenSize.height) {
            thumbnailSize.height = kThumbnailImageDefaultHeight;
        }else if (originalSize.height < kThumbnailImageDefaultWidth) {
            thumbnailSize = originalSize;
        } else {
            thumbnailSize.height = kThumbnailImageDefaultWidth;
        }
        thumbnailSize.width = originalSize.width * (thumbnailSize.height / originalSize.height);
    }
    return [self drawImageSize:thumbnailSize inRect:(CGRect){CGPointZero, thumbnailSize}];
}

- (UIImage *)drawImageSize:(CGSize)size inRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
