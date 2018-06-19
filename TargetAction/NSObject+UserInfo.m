//
//  NSObject+UserInfo.m
//  TargetAction
//
//  Created by qingfengiOS on 2018/6/19.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import "NSObject+UserInfo.h"
#import <objc/message.h>

@implementation NSObject (UserInfo)

#pragma mark - Setters
- (void)setUserInfo:(NSDictionary *)userInfo {
    objc_setAssociatedObject(self, @"userInfo", userInfo, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Getters
- (NSDictionary *)userInfo {
    return objc_getAssociatedObject(self, @"userInfo");
}


@end
