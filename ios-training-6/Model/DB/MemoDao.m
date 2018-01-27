//
//  MemoManager.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "MemoDao.h"
#import "DBConnect.h"
#import "SQLString.h"
@implementation MemoDao



#pragma mark - initialize

-(id)init{
    
    self = [super init];
    if(self){
        FMDatabase* db = [DBConnect getConnection];
        [db open];
        NSString *sql = SQLCreate;
        [db executeUpdate:sql];
        [db close];
    }
    return self;
}

#pragma mark - pubric

-(NSMutableArray<Memo*>*)showMemoList{
    
    FMDatabase *db = [DBConnect getConnection];
    NSString *sqlite = SQLSelect;
    [db open];
    FMResultSet* results = [db executeQuery:sqlite];
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:0];
    
    while ([results next]){
        Memo* memo = [[Memo alloc] init];
        
        memo.memoId       = [results intForColumn:@"memo_id"];
        memo.memoTitle    = [results stringForColumn:@"memo_title"];
        memo.memoDate     = [results dateForColumn:@"memo_date"];
        memo.memoText     = [results stringForColumn:@"memo_text"];
        
        [list addObject:memo];
    }
    [db close];
    return list;
    
}

- (void)addNewMemo:(Memo*)memo{
    
    NSString *title      = memo.memoTitle;
    NSDate *date         = memo.memoDate;
    NSString *text       = memo.memoText;
    
    FMDatabase* db = [DBConnect getConnection];
    [db open];
    [db beginTransaction];
    
    NSString *sql = SQLInsert;
    [db executeUpdate:sql,title,date,text];
    [db commit];
    [db close];
    
}


- (void)updateMemo:(Memo*)memo{
    
    NSString *title      = memo.memoTitle;
    NSDate *date         = memo.memoDate;
    NSString *text       = memo.memoText;
    NSInteger memoId     = memo.memoId;
    
    FMDatabase* db = [DBConnect getConnection];
    [db open];
    [db beginTransaction];
    
    NSString *sql = SQLUpdate;
    
    [db executeUpdate:sql,title,date,text,[NSNumber numberWithInteger:memoId]];
    [db commit];
    [db close];

}

-(void)removeMemo:(NSInteger)memoId{
    
    FMDatabase* db = [DBConnect getConnection];
    [db open];
    [db beginTransaction];
    NSString *sql = SQLDelete;
    [db executeUpdate:sql,[NSNumber numberWithInteger:memoId]];
    [db commit];
    [db close];

}

-(void)removeAllAtOnce{
    
    FMDatabase* db = [DBConnect getConnection];
    [db open];
    [db beginTransaction];
    
    NSString *sql = SQLDeleteAll;
    [db executeUpdate:sql];
    [db commit];
    [db close];
    
}



@end
