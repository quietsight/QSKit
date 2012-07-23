//
//  QSKeychain.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/22/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSObject.h"
#import "QSCrypto.h"
#import "QSID.h"
#import "NSDictionary+QSAdditions.h"
#import "NSData+QSAdditions.h"
#import "QSKit_Helper.h"
#import "QSDataManager.h"

#define QSKEYCHAIN_DATE_FORMAT_STRING @"yyyyMMddKKmmss[ZZZ]"
#define QSKEYCHAIN_FILE_NAME @"qskc.dataStore"
@class QSKeychainCredential;

@interface QSKeychain : QSObject

+ (BOOL)saveCredential:(QSKeychainCredential *)credential;
+ (BOOL)updateCredential:(QSKeychainCredential *)credential;
+ (QSKeychainCredential *)credentialWithIdentifier:(NSString *)identifier key:(NSString *)key;

+ (BOOL)compareCredentialToStore:(QSKeychainCredential *)credential;

@end


@interface QSKeychainCredential : QSObject
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSDate *expire;
@property (nonatomic, strong, readonly) NSString *digest;
@property (nonatomic, strong) NSString *salt;
@property (nonatomic, strong) NSString *encriptionKey;

+ (id)credentialWithUsername:(NSString *)username password:(NSString *)password identifier:(NSString *)identifier;
- (id)initWithUsername:(NSString *)username password:(NSString *)password identifier:(NSString *)identifier;
- (BOOL)fromDictionary:(NSDictionary *)bson;
- (NSDictionary *)dictionaryRepresentation;

- (BOOL)compare:(QSKeychainCredential *)credential;

- (void)dump;

@end