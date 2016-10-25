//
//  UIImage+ImageClip.m
//  图片裁剪
//
//  Created by liuxingchen on 16/10/25.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "UIImage+ImageClip.h"

@implementation UIImage (ImageClip)
//图片剪切成圆形加圆环
+(UIImage *)imageWithImage:(UIImage *)image border:(CGFloat)borderWdith borderColor:(UIColor *)color
{
    // 图片的宽度和高度
    CGFloat imageHW = image.size.width;
    // 设置圆环的宽度
    CGFloat border = borderWdith;
    // 圆形的宽度和高度
    CGFloat ovalHW = imageHW + 2 * border;
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalHW, ovalHW), NO, 0);
    // 2.画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalHW, ovalHW)];
    
    [color set];
    [path fill];
    // 3.设置裁剪区域
    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageHW, imageHW)];
    [clipPath addClip];
    // 4.绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    // 5.获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    return clipImage;
}
//屏幕截屏
+(UIImage *) imageWithCaputerView:(UIView *)view
{
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 把控件上的图层渲染到上下文,layer只能渲染
    [view.layer renderInContext:ctx];
    
    // 生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end
