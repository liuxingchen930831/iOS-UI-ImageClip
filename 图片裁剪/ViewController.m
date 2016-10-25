//
//  ViewController.m
//  图片裁剪
//
//  Created by liuxingchen on 16/10/25.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageClip.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    //加载图片
    UIImage *image= [UIImage imageNamed:@"阿狸头像"];
    self.imageView.image  = [UIImage imageWithImage:image border:2 borderColor:[UIColor greenColor]];
    //保存图片
    self.imageView.image = [UIImage imageWithCaputerView:self.view];
    // image转data
    // compressionQuality： 图片质量 1:最高质量(网络上传的时候需要压缩)
    NSData *data = UIImageJPEGRepresentation(self.imageView.image, 1);
    [data writeToFile:@"/Users/yao/Desktop/liu.jpeg" atomically:YES];
    
}
-(void)cilipImage
{
    //加载图片
    UIImage *image= [UIImage imageNamed:@"阿狸头像"];
    //1.获取图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.描述路径
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //2.1把路径设置为裁剪区域
    [path addClip];
    //3.绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4.从上下文中获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图片上下文
    UIGraphicsEndImageContext();
    
    self.imageView.image = clipImage;
}
@end
