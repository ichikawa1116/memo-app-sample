//
//  MemoManager.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Memo.h"

@interface MemoDao : NSObject

- (NSMutableArray<Memo*>*)showMemoList;
- (void)addNewMemo:(Memo*)memo;
- (void)removeMemo:(NSInteger)memoId;
- (void)updateMemo:(Memo*)memo;
- (void)removeAllAtOnce;
@end
