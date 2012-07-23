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
+ (NSString *)sha256:(NSString *)input {
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, data.length, digest);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", digest[i]];
    }
    return hash;
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

+ (NSString *)aes256EncriptString:(NSString *)string key:(NSString *)key {
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
	return [self aes256EncriptData:stringData key:key];
}
+ (NSString *)aes256EncriptData:(NSData *)data key:(NSString *)key {
    char keyPtr[kCCKeySizeAES256 + 1];
	bzero(keyPtr, sizeof(keyPtr));
	[key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
	NSUInteger dataLength = [data length];
	size_t bufferSize = dataLength + kCCBlockSizeAES128;
	void *buffer = malloc(bufferSize);
	size_t numBytesEncrypted = 0;
	CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES256, NULL, [data bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
	if (cryptStatus == kCCSuccess) {
        // NSData owns the buffer
		NSData *encData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [encData base64Encode];
	}
	free(buffer);
	return nil;
}
+ (NSString *)aes256DecriptBase64String:(NSString *)string key:(NSString *)key {
    NSData *stringData = [string base64Decode];
	char keyPtr[kCCKeySizeAES256+1];
	bzero(keyPtr, sizeof(keyPtr));
	[key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
	NSUInteger dataLength = [stringData length];
	size_t bufferSize = dataLength + kCCBlockSizeAES128;
	void *buffer = malloc(bufferSize);
	size_t numBytesDecrypted = 0;
	CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES256, NULL , [stringData bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);
	if (cryptStatus == kCCSuccess) {
        // NSData owns the buffer
        NSData *encData = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
		return [[NSString alloc] initWithData:encData encoding:NSUTF8StringEncoding];
	}
	free(buffer);
	return nil;
}

@end
