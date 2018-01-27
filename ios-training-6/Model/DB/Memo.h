//
//  Memo.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Memo : NSObject

@property (nonatomic) NSInteger memoId;
@property (strong, nonatomic) NSString *memoTitle;
@property (strong, nonatomic) NSString *memoText;
@property (strong, nonatomic) NSDate *memoDate;

- (instancetype)initWithMemo:(NSString*)memoContent
                      MemoID:(NSInteger)memoId
                    MemoDate:(NSDate *)memoDate;
@end
