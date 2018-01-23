//
//  XTViewController.m
//  RouterDemo
//
//  Created by holdtime on 2017/3/13.
//  Copyright © 2017年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "XTViewController.h"

@interface XTViewController ()

@end

@implementation XTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- 容错处理
- (void)action_notFoundViewController {

    NSLog(@"没有找到相应控制器");
}

- (void)action_notFoundAction {
   
    NSLog(@"没有找到相应的方法");
}

@end
