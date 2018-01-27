//
//  MemoDataProvider.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

//Model
#import "MemoDao.h"
//View
#import "MemoDataProvider.h"
#import "MemoCell.h"
//Category
#import "NSDate+Style.h"

@implementation MemoDataProvider

static NSString * const CellIdentifier = @"MemoCell";

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MemoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Memo *memo = [Memo new];
    memo = [self.items objectAtIndex:indexPath.row];
    cell.titleLb.text = memo.memoTitle;
    cell.textLb.text  = memo.memoText;
    cell.dateLb.text  = [memo.memoDate dateStyle];
    return cell;

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        MemoDao *dao = [[MemoDao alloc]init];
        [dao removeMemo:[self getMemoId:indexPath]];
        [self.items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
    
    if ([self.delegate respondsToSelector:@selector(didFinishDeleteMemo)]) {
        [self.delegate didFinishDeleteMemo];
    }
}

#pragma mark - private
-(NSInteger)getMemoId :(NSIndexPath*)indexPath{
    
   return  self.items[indexPath.row].memoId;
}



@end
