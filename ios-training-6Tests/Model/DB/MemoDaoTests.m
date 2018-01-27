//
//  MemoDaoTests.m
//  ios-training-6Tests
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MemoDao.h"

@interface MemoDaoTests : XCTestCase

@end

@implementation MemoDaoTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    
    [super tearDown];
}


- (void)testDeleteAll {
    
    // Setup
    MemoDao *dao = [[MemoDao alloc]init];
    [dao delete];
    XCTAssertEqual([MemoDao selectAll].count, 0);
    
    Memo *memoObject = [Memo new];
    memoObject.memoId = 1;
    memoObject.updateDate = [NSDate date];
    memoObject.text = @"タイトル";
    [MemoDao insert:memoObject];
    
    Memo *memoObject2 = [Memo new];
    memoObject2.memoId = 2;
    memoObject2.updateDate = [NSDate date];
    memoObject2.text = @"タイトル\nテキスト";
    [MemoDao insert:memoObject2];
    
    XCTAssertEqual([MemoDao selectAll].count, 2);
    
    // Exercise
    [MemoDao deleteAll];
    
    // Verify
    XCTAssertEqual([MemoDao selectAll].count, 0);
}

- (void)testExample {
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
