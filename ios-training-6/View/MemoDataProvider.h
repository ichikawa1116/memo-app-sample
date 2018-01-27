//
//  MemoDataProvider.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Memo.h"

@protocol DeleteMemoDelegate <NSObject>
- (void)didFinishDeleteMemo;
@end

@interface MemoDataProvider : NSObject<UITableViewDataSource>

@property (weak, nonatomic) id<DeleteMemoDelegate> delegate;
@property (strong, nonatomic) NSMutableArray<Memo*> *items;
@end
