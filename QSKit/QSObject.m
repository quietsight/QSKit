//
//  QSObject.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSObject.h"

@implementation QSObject

/*
 *  Class methods for parsing/writing JSON
 */
+ (NSString *)writeJSON:(id)object {
    return [[NSString alloc] initWithData:[self writeBinaryJSON:object] encoding:NSUTF8StringEncoding];
}
+ (NSData *)writeBinaryJSON:(id)object {
    return [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
}
+ (id)parseJSON:(id)json {
    NSData* data = nil;
    if ([json isKindOfClass:[NSString class]]) {
        data = [json dataUsingEncoding:NSUTF8StringEncoding];
    } else {
        data = json;
    }
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

@end
