//
//  main.m
//  Block(循环)
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockTest.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BlockTest *test = [[BlockTest alloc] init];
        
        [test blockTest];
    }
    return 0;
}
