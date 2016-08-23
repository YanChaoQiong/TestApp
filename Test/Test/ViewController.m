//
//  ViewController.m
//  Test
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "ViewController.h"

typedef void (^MyBlock) ();

@interface ViewController ()
{
    NSObject *_hObject;
}

@property (nonatomic,retain) NSObject *pObject;

@property (nonatomic,copy)MyBlock myblock;

@end

static NSObject *sObject;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *object = [[NSObject alloc]init];
    
    NSLog(@"object:%ld",[object retainCount]);
    
    _hObject = [[NSObject alloc]init];
    NSLog(@"_hObject: %ld",[_hObject retainCount]);
    
    _pObject = [[NSObject alloc]init ];
    NSLog(@"pObject: %ld",[_pObject retainCount]);
    
    sObject = [[NSObject alloc]init];
    NSLog(@"sObject: %ld ",[sObject retainCount]);
    
    self.myblock = ^{
        
        NSLog(@"self: %ld",[self retainCount]);// 内部使用局部的对象时，会对这个对象引用计数 +1
        NSLog(@"_hObject: %ld",[_hObject retainCount]);//内部使用对象的实列变量，实列变量引用计数不会 +1 ，但是当前对象（self）的引用计数＋1；
        NSLog(@"_pObject: %ld ",[_pObject retainCount]);// 内部使用了对象属性，这个属性的引用计数不会 ＋1， 但是当前对象（self）的引用计数 ＋1；
        NSLog(@"sObject: %ld",[sObject retainCount]);// 内部使用静态对象，对象不会引用计数＋1， 当前对象（self）也不会引用计数 ＋1；
    };
    self.myblock();
    
    NSLog(@"self: %ld",[self retainCount]);
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
