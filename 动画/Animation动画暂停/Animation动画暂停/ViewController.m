//
//  ViewController.m
//  Animation动画暂停
//
//  Created by tens04 on 16/8/27.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *layer;
    BOOL _isPause;//暂停
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.position = self.view.center;
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"get"].CGImage);
    
    [self.view.layer addSublayer:layer];
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_isPause) {
       [self resumeAnimation];
    }else
    {
        [self pauseAnimation];
        
    }
    _isPause = !_isPause;
}
//暂停动画
- (void)pauseAnimation {
     // CACurrentMediaTime(): 当前媒体时间，表示系统启动后到当前的秒数，当系统重启后这个时间也重置
    CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.timeOffset = pauseTime;//动画偏离就停止时间
    layer.speed = 0;//动画的速度
    
}
//恢复动画
- (void)resumeAnimation {
    //获取暂停时的时间
    CFTimeInterval pasusetime = [layer timeOffset];
    layer.speed = 1;
    layer.timeOffset = 0;
    layer.beginTime = 0;
    //设置开始时间（继续动画，这样设置相当于让动画等待的秒数等于暂停的秒\）
    layer.beginTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pasusetime;
    
}

- (CAAnimation *)rotationAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"rotaionrotaionrotaionrotaion"];
    animation.duration = 2.0;
    animation.byValue = @(2 * M_PI);
    animation.repeatCount = HUGE_VALF;
    
    //设置动画开始的媒体时间 （用于设置动画的延迟启动），要加上CACurrentMediaTime
    animation.beginTime = CACurrentMediaTime() +2;
    [layer addAnimation:animation forKey:@"rotaion"];
    return animation;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
