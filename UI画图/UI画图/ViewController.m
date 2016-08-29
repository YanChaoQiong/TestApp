//
//  ViewController.m
//  UI画图
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BezierPathView *pathView = [[BezierPathView alloc]initWithFrame:self.view.bounds];
    pathView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:pathView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
