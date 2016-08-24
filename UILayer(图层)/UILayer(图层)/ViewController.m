//
//  ViewController.m
//  UILayer(图层)
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 300, 200)];
    view.backgroundColor = [UIColor redColor];
    //layer视图显示的背景颜色
    view.layer.backgroundColor = [UIColor orangeColor].CGColor;
    //layer边框的宽度
    view.layer.borderWidth = 3;
    //layer显示边框的颜色
    view.layer.borderColor = [UIColor blackColor].CGColor;
    //边角的角度
    view.layer.cornerRadius = 20;
    
    [self.view addSubview:view];
    
     //创建layer
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(10,320 , 300, 200);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    //将视图添加到父视图层
    [self.view.layer addSublayer:layer];
    
    //3,填充图片内容，需要 UIImage 桥接 (__bridge )到CGImage
        layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"image4.jpg"].CGImage);
    //4, 使用 layer CATextLayer 子类填充文字
    CATextLayer *textLayer = [[CATextLayer alloc]init];
    textLayer.frame = CGRectMake(10, 550, 200, 30);
    textLayer.string = @"这是layer填充到文字内容";
    textLayer.foregroundColor = [UIColor blueColor].CGColor;
    textLayer.backgroundColor = [UIColor redColor].CGColor;
    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:20 weight:500]);
    textLayer.fontSize = 20;
    textLayer.alignmentMode = @"center";
    [self.view.layer addSublayer:textLayer];
    
   

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
