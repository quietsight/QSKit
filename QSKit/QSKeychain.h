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
+ (BOOL)deleteCredentialWithIdentifier:(NSString *)identifier;

+ (BOOL)compareCredentialToStore:(QSKeychainCredential *)credential;

@end


@interface QSKeychainCredential : QSObject

/** Username to save
 
 */
@property (nonatomic, strong) NSString *username;

/** User Password
 
 If the `encriptionKey` is set this will be encripted and stored with the credintal.  If not it will be used to create the digest.
 
 The encription is AES-256
 */
@property (nonatomic, strong) NSString *password;

/** Unique Identifier
 
 This is what you will use to get the credential
 */
@property (nonatomic, strong) NSString *identifier;

/** The Exparation of the credential
 
 This defaults to 30 years in the future.
 */
@property (nonatomic, strong) NSDate *expire;

/** The Digest
 
 This is a SHA256 of the information stored.
 */
@property (nonatomic, strong, readonly) NSString *digest;

/** Salt
 
 All digests should be salted, so this one is.  This is the salt used for the digest.
 */
@property (nonatomic, strong) NSString *salt;

/** The encription key
 
 This is the AES-256 encription key to use for saving the password
 */
@property (nonatomic, strong) NSString *encriptionKey;

/** Create a new credential object to save or compare
 
 @param username The username for the credential
 
 @param password The password for the credential
 
 @param identifier The unique identifier for the credential
 
 @return An instantuated QSKeychainCredential object
 */
+ (id)credentialWithUsername:(NSString *)username password:(NSString *)password identifier:(NSString *)identifier;
- (id)initWithUsername:(NSString *)username password:(NSString *)password identifier:(NSString *)identifier;


- (BOOL)fromDictionary:(NSDictionary *)bson;
- (NSDictionary *)dictionaryRepresentation;

/** Compare two QSKeychainCredential objects
 
 @param credential The credential to compare to
 
 @return A BOOL representing if the QSKeychainCredential objects match.
 */
- (BOOL)compare:(QSKeychainCredential *)credential;

- (void)dump; // Simulator Only

@end