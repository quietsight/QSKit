//
//  NSArray+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "NSArray+QSAdditions.h"

@implementation NSArray (QSAdditions)

- (NSString *)json {
    return [QSObject writeJSON:self];
}
- (NSData *)binaryJson {
    return [QSObject writeBinaryJSON:self];
}

@end
