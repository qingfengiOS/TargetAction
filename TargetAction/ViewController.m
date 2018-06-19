//
//  ViewController.m
//  TargetAction
//
//  Created by qingfengiOS on 2018/6/19.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+UserInfo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sendBtn.userInfo = @{@"name": @"qingfengiOS", @"age": @18};
    [_sendBtn addTarget:self action:@selector(testBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Actions
- (void)testBtnAction:(UIButton *)sender {
    NSDictionary *userInfoDic = sender.userInfo;
    NSLog(@"userInfoDic = %@",userInfoDic);
    
    _contentLabel.text = [NSString stringWithFormat:@"name:%@\nage:%@",userInfoDic[@"name"],userInfoDic[@"age"]];
}

/*
 Target-Action是一种比较常见的设计模式
 常用的UIControl标准控件（如:UIButton）就是通过这种方式传递参数的，它在对象产生某个事件的特定时刻，给一个对象发送一个消息。
 
 这里（Category中）用到了runtime的objc_getAssociatedObject和objc_setAssociatedObject两个运行时函数的使用，动态地向NSObject根类中添加了userInfo属性达到传递多参数的目的。
 */

@end
