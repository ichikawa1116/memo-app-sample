//
//  MemoItemSorter.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "MemoCellItemManager.h"

@implementation MemoCellItemManager

#pragma mark - pubric

+ (NSMutableArray<NSString*>*)sortRows:(NSString*)memoContent{
    
    NSMutableArray *lines = [NSMutableArray array];
    [memoContent enumerateLinesUsingBlock:^(NSString *line, BOOL *stop){
        [lines addObject:line];
    }];
    
    return lines;
}


+ (NSArray<NSString*>*)divideString:(NSString*)text{
    //半角スペースで分割する
    NSArray *rows = [text componentsSeparatedByString:@" "];
    return rows;
}

@end
