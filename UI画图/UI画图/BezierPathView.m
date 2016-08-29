//
//  BezierPathView.m
//  UI画图
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView
- (void)drawRect:(CGRect)rect {
    [self drawLines];
    [self drawGraphics];
    [self drawArc];
    [self drawBezier];
}

- (void)drawLines {
    
    // 1、创建一条路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2、将画笔移动到某个点
    [path moveToPoint:CGPointMake(20, 50)];
    
    // 3、绘制一条直线到某个点
    [path addLineToPoint:CGPointMake(20, 300)];
    [path addLineToPoint:CGPointMake(140, 200)];
    // [path addLineToPoint:CGPointMake(20, 50)];
    // 4、闭合路径
    [path closePath];
    
    [path moveToPoint:CGPointMake(160, 200)];
    [path addLineToPoint:CGPointMake(300, 180)];
    [path addLineToPoint:CGPointMake(20,300)];
    [path closePath];
    
//    [path moveToPoint:CGPointMake(160, 200)];
//    [path addLineToPoint:CGPointMake(20, 350)];
//    [path addLineToPoint:CGPointMake(300,350)];
//    [path closePath];

    /*
     CGFloat dashs[] = {2,10,2};
     // 5、设置虚线： dashs: 虚线的虚实线的长度，count: 虚线的组成段数， phase: 设置虚线的起始位置
     [path setLineDash:dashs count:3 phase:0];
     */
    
    // 6、设置线条宽度
    [path setLineWidth:10];
    
    // 7、设置线头的样式：三种样式，kCGLineCapButt, kCGLineCapRound, kCGLineCapSquare
    [path setLineCapStyle:kCGLineCapSquare];
    
    // 8、设置线条连接点的样式：kCGLineJoinMiter, kCGLineJoinRound,kCGLineJoinBevel
    [path setLineJoinStyle:kCGLineJoinRound];
    
    // 6、设置描边的颜色
    [[UIColor redColor] setStroke];
    [[UIColor whiteColor] setFill];
    
    // 7、绘制(描边)
    [path stroke];
    
    // 8、绘制(内部填充)
    [path fill];
}

- (void)drawGraphics {
    CGRect rect = CGRectMake(140, 100, 50, 300);
   // UIBezierPath * path = [UIBezierPath bezierPathWithRect:rect];
    // 圆角矩形
    // UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:20];
    
    // 内切的椭圆、圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];

    [[UIColor redColor]setStroke];
    [[UIColor orangeColor]setFill];
    path.lineWidth = 5;
    [path stroke];
    [path fill];
    [path closePath];
}
- (void)drawArc {
    CGPoint center = self.center;
    /**
     Center: 圆心
     radius: 半径
     startAngle: 起始弧度
     endAngle: 终点弧度
     clockwise:是否顺时针
     **/
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:0 endAngle: M_PI_2 clockwise:YES];
    

    path.lineWidth = 5;
    [path addLineToPoint:center];
    [path closePath];
    [path stroke];
    [path fill];
}
- (void)drawBezier {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor redColor]setStroke];
    path.lineWidth = 5;
    CGPoint beginPoint = CGPointMake(0, 300);
    CGPoint endPoint = CGPointMake(70, 300);
    CGPoint controlPoint = CGPointMake(45, 200);
    [path moveToPoint:beginPoint];
    
    // 1、一个控制点的贝塞尔曲线
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    
    CGPoint beginPoint_1 = CGPointMake(70, 300);
    CGPoint endPoint_1 = CGPointMake(170, 300);
    CGPoint controlPoint_1 = CGPointMake(95, 400);
    CGPoint controlPoint_2 = CGPointMake(145, 100);
    
    [path moveToPoint:beginPoint_1];
    // 2、两个控制点的贝塞尔曲线
    [path addCurveToPoint:endPoint_1 controlPoint1:controlPoint_1 controlPoint2:controlPoint_2];
    
    // 3、拼接两条路径
    UIBezierPath *subPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(170, 300, 200, 200)];
    [path appendPath:subPath];
    
    // 4、移除所有的路径
    // [path removeAllPoints];
    
    [path stroke];
}


@end
