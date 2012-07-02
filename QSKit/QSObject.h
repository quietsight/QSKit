//
//  QSObject.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QSObject : NSObject

/**
 *  Class methods for parsing/writing JSON
 */
+ (NSString *)writeJSON:(id)object;
+ (id)parseJSON:(id)json;
+ (NSData *)writeBinaryJSON:(id)object;

@end
