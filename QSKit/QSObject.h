//
//  QSObject.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QSObject : NSObject

/** Write JSON
 
 Returns a JSON string representation of the passed object
 */
+ (NSString *)writeJSON:(id)object;

/** Write JSON
 
 Returns a JSON data representation of the passed object
 */
+ (NSData *)writeBinaryJSON:(id)object;

/** Parse JSON
 
 Parse the JSON string/data
 
 Returns an NSArray or NSDictionary
 */
+ (id)parseJSON:(id)json;

@end
