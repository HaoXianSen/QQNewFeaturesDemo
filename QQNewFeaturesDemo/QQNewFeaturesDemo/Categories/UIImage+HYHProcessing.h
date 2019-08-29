//
//  UIImage+HYHProcessing.h
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HYHProcessing)

/**
 获取圆角图片

 @param rect 绘制范围
 @param radius 绘制半径
 @return 指定半径的圆角图片
 */
- (UIImage *)roundedImageWithRect:(CGRect)rect cornerRadius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
