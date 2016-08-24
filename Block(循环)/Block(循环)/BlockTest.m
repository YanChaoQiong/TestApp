//
//  BlockTest.m
//  Block(循环)
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import "BlockTest.h"
typedef void(^MyBlock) ();

@interface BlockTest ()

@property (nonatomic,copy)MyBlock myBlock;
@property (nonatomic,copy) NSString *obj;

@end
@implementation BlockTest

- (void)blockTest {
        // 使用__weak 关键字修饰，weakSelf 使用弱引用，也就表示self 也使用了弱引用修饰， 修饰后block 内部就不会对self持有，也就不会导致循环引用
    __weak typeof (self)weakSelf = self;
    // __block typeof(self)weakSelf = self; // 手动管理里面使用__block修饰
    

    self.myBlock = ^{
        // 使用当前对象的实例变量会导致循环引用

        weakSelf.obj = @"flasjflads";
        // 使用了当前对象的实例方法也会导致循环引用

        [weakSelf method];
        
    };
    
    self.myBlock();
    
    
    MyBlock block = ^{
        
        // 使用当前对象的实例变量会导致循环引用
        self.obj = @"flasjflads";
        
        // 使用了当前对象的实例方法也会导致循环引用
        [self method];
    };
    block();

}
- (void)method {
    
    NSLog(@"method");
}

- (void)dealloc {
    
    NSLog(@"dealloc");
}
@end
