//
//  ViewController.m
//  CALayer3D变化
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *layer;
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 10, 100, 100);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    //layer.anchorPoint = CGPointMake(0, 0);
    
    [self.view.layer addSublayer:layer];
//    view = [[UIView alloc]init];
//    view.frame = CGRectMake(0, 0, 150, 150);
//    view.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:view];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 //   [self transform];
    [self hidenAnimation];
}

- (void)hidenAnimation {
    //layer.position = CGPointMake(50, 50);
    //隐式动画：当layer的属性发生变换时会默认产生动画效果，动画时间0.25s

    layer.opacity = 0.2;
    
    layer.cornerRadius = 50;
    //组合CATransform3D
    CATransform3D transform_01 = CATransform3DScale(layer.transform, 2, 2, 1);
    CATransform3D transform_02 = CATransform3DRotate(layer.transform, M_PI_4, 0, 0, 1);
    layer.transform = CATransform3DConcat(transform_01, transform_02);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),dispatch_get_main_queue(),
    ^{
        layer.opacity = 1;
        layer.cornerRadius = 0;
        layer.transform = CATransform3DIdentity;
    });
    }
//3D变化
- (void)transform {
    // 1、通过函数设置transform

    layer.transform = CATransform3DScale(layer.transform, 0, 0, 100);
    layer.transform = CATransform3DScale(layer.transform, 1, 1, 1.5);
    layer.transform = CATransform3DRotate(layer.transform, M_PI_4, 0, 0, 1);
    //    view.transform = CGAffineTransformRotate(view.transform, M_PI_4);
    
    
    // 2、通过 KVC 设置transform
    //
    //    [layer setValue:@2 forKeyPath:@"transform.scale.x"];
    //    [layer setValue:@2 forKeyPath:@"transform.scale"];
    //
    //    [layer setValue:@100 forKeyPath:@"transform.translation"];
    //    [layer setValue:@100 forKeyPath:@"transform.translation.x"];
    //
    //    [layer setValue:@M_PI_4 forKeyPath:@"transform.rotation"];
    //    [layer setValue:@M_PI_4 forKeyPath:@"transform.rotation.x"];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
