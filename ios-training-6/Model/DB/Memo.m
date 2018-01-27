//
//  Memo.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "Memo.h"

@implementation Memo

#pragma mark - initialize

- (instancetype)initWithMemo:(NSString*)memoContent
                             MemoID:(NSInteger)memoId
                           MemoDate:(NSDate *)memoDate{
    
    NSMutableArray *lines = [NSMutableArray array];
    [memoContent enumerateLinesUsingBlock:^(NSString *line, BOOL *stop){
        [lines addObject:line];
    }];
    
    self.memoTitle  = lines.firstObject;
    [lines removeObjectAtIndex:0];
    
    NSString *otherLines = [lines componentsJoinedByString:@""];
    self.memoText  = otherLines;
    self.memoDate = memoDate;
    
    return self;
}
@end
