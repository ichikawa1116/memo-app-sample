//
//  MemoListToolbar.m
//  ios-trainning-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017年 Manami Ichikawa. All rights reserved.
//

#import "MemoListToolbar.h"

@implementation MemoListToolbar

#pragma mark - pubric

+ (NSString *)rightToolbarButtonTitle:(NSInteger)count {
    return (count == 0) ? NSLocalizedString(@"noMemos", @"メモなし") : [NSString stringWithFormat:NSLocalizedString(@"memosCount", @"%d件のメモ"), count];
    
}

+ (NSString *)leftToolbarButtonTitle:(BOOL)isEditing {
    return isEditing ? NSLocalizedString(@"deleteAll", @"すべて削除") : NSLocalizedString(@"addMemo", @"メモ追加");
}

@end
