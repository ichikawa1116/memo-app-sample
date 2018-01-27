//
//  DBConnect.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DBConnect : NSObject

+ (FMDatabase*)getConnection;

@end
