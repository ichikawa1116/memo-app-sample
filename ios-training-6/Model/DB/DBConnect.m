//
//  DBConnect.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "DBConnect.h"
@interface DBConnect()

@property (strong, nonatomic) NSString *dbPath;
@end

@implementation DBConnect

static NSString * const DbName = @"memo.db";
#pragma mark - pubric

+ (NSString*)getDbFilePath{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *directory = [paths
                     objectAtIndex:0];
    return [directory stringByAppendingPathComponent:DbName];
}

+ (FMDatabase*)getConnection{
    
    NSString *dbPath;
    dbPath = [DBConnect getDbFilePath];
    return [FMDatabase databaseWithPath:dbPath];
};


@end
