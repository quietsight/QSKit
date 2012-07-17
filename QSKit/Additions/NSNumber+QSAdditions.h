//
//  NSNumber+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (QSAdditions)

- (NSNumber *)increment;
- (NSNumber *)deincrement;
- (NSNumber *)incrementByNumber:(double_t)number;
- (NSNumber *)deincrementByNumber:(double_t)number;

@end
