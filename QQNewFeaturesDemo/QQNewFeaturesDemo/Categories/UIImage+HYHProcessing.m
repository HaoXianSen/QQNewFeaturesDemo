//
//  UIImage+HYHProcessing.m
//  QQNewFeaturesDemo
//
//  Created by harry on 2019/8/29.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "UIImage+HYHProcessing.h"

@implementation UIImage (HYHProcessing)

- (UIImage *)roundedImageWithRect:(CGRect)rect cornerRadius:(CGFloat)radius {
    UIImage *image = self;
    CGRect bounds = rect;
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, 1.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [path addClip];
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return returnImage;
}

@end
