//
//  NSNumber+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "NSNumber+QSAdditions.h"

@implementation NSNumber (QSAdditions)

- (NSNumber *)increment {
    return [self incrementByNumber:1];
}
- (NSNumber *)deincrement {
    return [self deincrementByNumber:1];
}
- (NSNumber *)incrementByNumber:(double_t)number {
    double_t nD = [self doubleValue];
    return [NSNumber numberWithDouble:nD + number];
}
- (NSNumber *)deincrementByNumber:(double_t)number {
    double_t nD = [self doubleValue];
    return [NSNumber numberWithDouble:nD - number];
}

@end
