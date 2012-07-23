//
//  QSKeychain.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/22/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSKeychain.h"

@interface QSKeychain ()

@end

@implementation QSKeychain

+ (BOOL)saveCredential:(QSKeychainCredential *)credential {
    NSMutableDictionary *d = [[[QSDataManager readBsonName:QSKEYCHAIN_FILE_NAME error:nil] json] mutableCopy];
    if (d == nil) {
        d = [NSMutableDictionary new];
    }
    [d setObject:[credential dictionaryRepresentation] forKey:credential.identifier];
    return [QSDataManager writeBsonToDisk:[d binaryJson]
                                     name:QSKEYCHAIN_FILE_NAME
                                    error:nil];
}
+ (BOOL)updateCredential:(QSKeychainCredential *)credential {
    return [self saveCredential:credential];
}
+ (QSKeychainCredential *)credentialWithIdentifier:(NSString *)identifier key:(NSString *)key {
    NSDictionary *dataDict = [[QSDataManager readBsonName:QSKEYCHAIN_FILE_NAME error:nil] json];
    if (dataDict == nil) {
        return nil;
    }
    if (![dataDict objectForKey:identifier]) {
        return nil;
    }
    QSKeychainCredential *c = [[QSKeychainCredential alloc] init];
    c.encriptionKey = key;
    if (![c fromDictionary:[dataDict objectForKey:identifier]]) {
        return nil;
    }
    return c;
}

+ (BOOL)compareCredentialToStore:(QSKeychainCredential *)credential {
    QSKeychainCredential *c = [QSKeychain credentialWithIdentifier:credential.identifier key:nil];
    if (c == nil) {
        return NO;
    }
    return [c compare:credential];
}


@end

@interface QSKeychainCredential ()

- (void)gen;

@end
@implementation QSKeychainCredential

+ (id)credentialWithUsername:(NSString *)username password:(NSString *)password identifier:(NSString *)identifier {
    return [[self alloc] initWithUsername:username password:password identifier:identifier];
}
- (id)initWithUsername:(NSString *)username password:(NSString *)password identifier:(NSString *)identifier {
    if (self = [super init]) {
        _username = username;
        _password = password;
        _identifier = identifier;
        _expire = [NSDate dateWithTimeIntervalSinceNow:946708560];
        [self gen];
    }
    return self;
}

- (BOOL)fromDictionary:(NSDictionary *)bson {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = QSKEYCHAIN_DATE_FORMAT_STRING;
    _username = [bson objectForKey:@"username"];
    _expire = [fmt dateFromString:[bson objectForKey:@"expire"]];
    _identifier = [bson objectForKey:@"id"];
    _salt = [bson objectForKey:@"salt"];
    _digest = [bson objectForKey:@"digest"];
    if (_encriptionKey) {
        _password = [QSCrypto aes256DecriptBase64String:[bson objectForKey:@"password"] key:_encriptionKey];
    }
    
    if (_username && _expire && _identifier && _salt && _digest) {
        return YES;
    }
    return  NO;
}

- (NSDictionary *)dictionaryRepresentation {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = QSKEYCHAIN_DATE_FORMAT_STRING;
    NSMutableDictionary *dict = [@{
        @"username" : _username,
        @"id" : _identifier,
        @"digest" : _digest,
        @"salt" : _salt,
        @"expire" : [fmt stringFromDate:_expire]
    } mutableCopy];
    if (_encriptionKey) {
        [dict setObject:[QSCrypto aes256EncriptString:_password key:_encriptionKey] forKey:@"password"];
    }
    return dict;
}

- (void)setUsername:(NSString *)username {
    _username = username;
    [self gen];
}
- (void)setPassword:(NSString *)password {
    _password = password;
    [self gen];
}
- (void)setExpire:(NSDate *)expire {
    _expire = expire;
    [self gen];
}
- (void)setSalt:(NSString *)salt {
    _salt = salt;
    [self gen];
}
- (void)gen {
    if (_salt == nil) {
        _salt = [QSCrypto sha1:[QSID newID]];
    }
    _digest = [QSCrypto sha256:[NSString stringWithFormat:@"%@&%@&%@-%@",_username,_password,_salt,_expire]];
}

- (BOOL)compare:(QSKeychainCredential *)credential {
    if ([self.expire timeIntervalSinceNow] < 0) {
        return NO;
    }
    if (![credential.username isEqualToString:self.username]) {
        return NO;
    }
    credential.salt = self.salt;
    credential.expire = self.expire;
    if (![credential.digest isEqualToString:self.digest]) {
        return NO;
    }
    return YES;
}

- (void)dump {
#if TARGET_IPHONE_SIMULATOR
    NSMutableString *logString = [[NSMutableString alloc] initWithFormat:@"  Username: %@\n",_username];
    [logString appendFormat:@"  Password: %@\n",_password];
    [logString appendFormat:@"  Identifier: %@\n",_identifier];
    [logString appendFormat:@"  Expries: %@\n",_expire];
    [logString appendFormat:@"  Digest: %@\n",_digest];
    [logString appendFormat:@"  Salt: %@\n",_salt];
    printf("Creditial:\n%s\n",[logString cStringUsingEncoding:NSUTF8StringEncoding]);
#endif
}

@end