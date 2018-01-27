//
//  UIViewController+Storyboard.m
//  ios-trainning-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017年 Manami Ichikawa. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (UIViewController *)initialViewControllerWithStoryboardName:(NSString *)storyboardName {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateInitialViewController];
}

@end
