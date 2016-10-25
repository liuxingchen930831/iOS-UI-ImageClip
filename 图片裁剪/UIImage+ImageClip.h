//
//  UIImage+ImageClip.h
//  图片裁剪
//
//  Created by liuxingchen on 16/10/25.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageClip)
+(UIImage *)imageWithImage:(UIImage *)image border:(CGFloat)borderWdith borderColor:(UIColor *)color;
+(UIImage *) imageWithCaputerView:(UIView *)view;

@end
