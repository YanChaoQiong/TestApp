//
//  ViewController.m
//  Clock
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "ViewController.h"
//获取但前时间的 年 月 日， 时 分 秒
#define  CURRENTSEC [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define  CURRENTMIN [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define  CURRENTHOUR [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]

//角度转换成弧度
#define ANGEL(x) x/180.0 * M_PI
#define KPerSecondA    ANGEL(6) //每秒6度
#define KPerMinuteA    ANGEL(6) //每分6秒
#define KPerHourA    ANGEL(30)  //没小时30度
#define KPerHourMinutedA    ANGEL(0.5) //没分钟时针扫过0.5度
#define KPerSecondMinuteA    ANGEL(0.1) //没秒钟扫过0.1度
@interface ViewController ()
@property (nonatomic,strong) UIImageView * ClockView;  //时钟图
@property (nonatomic,strong)CALayer * layerSec; // 秒
@property (nonatomic,strong)CALayer * layerMinute;  //分钟
@property (nonatomic,strong)CALayer * layerHourl;   //小时

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ClockView];
    [self.view.layer addSublayer:self.layerHourl];
     [self.view.layer addSublayer:self.layerMinute];
     [self.view.layer addSublayer:self.layerSec];
   
//
   
   
    //添加时针
    
   
#pragma mark - 懒加载时间改变

   
    [self timeChange];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];

}
- (void)timeChange
{
  
        //_layerHourl.transform = CATransform3DMakeRotation(secondRotation(sencond), 0, 0, 1);
    self.layerSec.transform = CATransform3DMakeRotation(CURRENTSEC *KPerSecondA, 0, 0, 1);
    self.layerMinute.transform = CATransform3DMakeRotation(CURRENTMIN *KPerMinuteA, 0, 0, 1);
    self.layerHourl.transform = CATransform3DMakeRotation(CURRENTHOUR *KPerHourA , 0, 0, 1);
    self.layerHourl.transform = CATransform3DMakeRotation(CURRENTMIN * KPerHourMinutedA +CURRENTHOUR * KPerHourA,0, 0, 1);
    
}





#pragma mark - 懒加载视图
- (UIImageView *)ClockView
{
    if (_ClockView == nil) {
        _ClockView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dial"]];
        _ClockView.center = self.view.center;
       // _ClockView.backgroundColor = [UIColor blackColor];
        _ClockView.bounds = CGRectMake(0, 0, 300, 300);

    }
    
    return _ClockView;
}

#pragma mark - 懒加载秒针

- (CALayer *)layerSec
{
    if (_layerSec == nil ) {
        _layerSec = [[CALayer alloc] init];
        //设置指针大小
        _layerSec.bounds = CGRectMake(0, 0, 10, 120);
        //设置背景图片
        _layerSec.contents = (__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
//        _layerSec.cornerRadius = 5;
        //设置锚点位置
        _layerSec.anchorPoint = CGPointMake(0.5, 1);
        _layerSec.position = self.view.center;
       
    }
    return _layerSec;
}
#pragma mark - 懒加载分针
- (CALayer *)layerMinute {
    if (_layerMinute == nil) {
        _layerMinute = [[CALayer alloc] init];
        _layerMinute.bounds = CGRectMake(0, 0, 10, 100);
        _layerMinute.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);
        
        //_layerMinute.cornerRadius = 5;
        _layerMinute.anchorPoint = CGPointMake(0.5, 1);
        _layerMinute.position = self.view.center;
    }
    return _layerMinute;
}
#pragma mark - 懒加载时针

- (CALayer *)layerHourl
{
    if (_layerHourl == nil) {
        _layerHourl = [[CALayer alloc] init];
        _layerHourl.bounds = CGRectMake(0, 0, 10, 80);
        _layerHourl.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);

        _layerHourl.cornerRadius = 5;
        _layerHourl.anchorPoint = CGPointMake(0.5, 1);
        _layerHourl.position = self.view.center;
        
        
    }
    return _layerHourl;
}
@end
