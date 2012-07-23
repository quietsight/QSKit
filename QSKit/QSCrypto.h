//
//  QSCrypto.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "QSObject.h"
#import "NSData+QSAdditions.h"
#import "NSString+QSAdditions.h"

@interface QSCrypto : QSObject

+ (NSString *)sha1:(NSString *)input;
+ (NSString *)md5:(NSString *)input;

+ (NSString *)sha256:(NSString *)input;


+ (NSString *)aes256EncriptString:(NSString *)string key:(NSString *)key;
+ (NSString *)aes256EncriptData:(NSData *)data key:(NSString *)key;
+ (NSString *)aes256DecriptBase64String:(NSString *)string key:(NSString *)key;


@end
