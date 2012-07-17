//
//  QSCrypto.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSCrypto.h"

@implementation QSCrypto

+ (NSString *)sha1:(NSString *)input {
    const char *cstr = [input UTF8String];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(NSUInteger i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    return [NSString stringWithString:output];
}

+ (NSString *)md5:(NSString *)input {
    const char *cstr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cstr, (unsigned int)strlen(cstr), digest );
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSUInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    return [NSString stringWithString:output];
}

@end
