//
//  NSArray+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSObject.h"

@interface NSArray (QSAdditions)

/** Write JSON
 
 Returns an JSON string representation of the object
 */
- (NSString *)json;

/** Write JSON
 
 Returns an JSON binary representation or the object
 */
- (NSData *)binaryJson;


@end
