//
//  MemoListToolbar.h
//  ios-trainning-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017年 Manami Ichikawa. All rights reserved.
//

@import Foundation;

@interface MemoListToolbar : NSObject
+ (NSString *)rightToolbarButtonTitle:(NSInteger)count;
+ (NSString *)leftToolbarButtonTitle:(BOOL)isEditing;
@end
