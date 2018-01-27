//
//  MemoItemSorter.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Memo.h"
@interface MemoCellItemManager : NSObject

@property (nonatomic) NSInteger memoId;
@property(strong, nonatomic) NSString *updateDate;
@property(strong, nonatomic) NSDate *memoTitle;
@property(strong, nonatomic) NSString *memoText;
+ (NSMutableArray<NSString*>*)sortRows:(NSString*)memoContent;
+ (NSArray<NSString*>*)divideString:(NSString*)text;

@end
