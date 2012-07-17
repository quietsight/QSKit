//
//  NSString+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSObject.h"
#import "QSKit_Helper.h"


@interface NSString (QSAdditions)

/** Encode the string as base64
 
 The object it's called on will be base64 encoded and returned.
 */
- (NSString *)base64Encode;

/** Decodes a base64 NSString
 
 Returns an NSData object
 */
- (NSData *)base64Decode;

/** Url encode the string
 
 Percent escapes `! * ' ( ) ; : @ & = + $ , / ? % # [ ]`
 */
- (NSString *)urlEncode;

/** JSON decode
 
 Returns an NSDictionary or NSArray based on the the JSON data passed
 */
- (id)json;

@end
