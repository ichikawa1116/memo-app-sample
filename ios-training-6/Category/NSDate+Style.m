//
//  NSDate+Style.m
//  ios-trainning-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017年 Manami Ichikawa. All rights reserved.
//

#import "NSDate+Style.h"

@implementation NSDate (Style)

- (NSString *)dateStyle {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    NSDate *nowDate = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                              fromDate:self];
    
    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;
    NSInteger hour = components.hour;
    NSInteger minite = components.minute;
    
    BOOL yearAreEqual = [calendar isDate:nowDate equalToDate:self toUnitGranularity:NSCalendarUnitYear];
    
    if (!yearAreEqual) {
        return [NSString stringWithFormat:@"%04d/%02d/%02d", (int)year, (int)month, (int)day];
    }
    
    BOOL dateAreEqual = [calendar isDate:nowDate equalToDate:self toUnitGranularity:NSCalendarUnitDay];
    
    if (!dateAreEqual) {
        return [NSString stringWithFormat:@"%02d/%02d", (int)month, (int)day];
    }
    return [NSString stringWithFormat:@"%02d:%02d", (int)hour, (int)minite];
}

@end
