//
//  QSDataManager.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSObject.h"
#import "NSData+QSAdditions.h"
#import "NSString+QSAdditions.h"
#import "NSDictionary+QSAdditions.h"
#import "NSArray+QSAdditions.h"

#define QS_DATA_MANAGER_BSON_EXT @"qs.bson"

@interface QSDataManager : QSObject


+ (NSString *)documentsDirectory;
+ (NSString *)filePathForFileName:(NSString *)fileName;
+ (BOOL)fileExists:(NSString *)fileName;
+ (BOOL)deleteFileNamed:(NSString *)fileName error:(NSError **)error;
+ (NSString *)fileWithName:(NSString *)name error:(NSError **)error;

+ (BOOL)writeBsonToDisk:(NSData *)data name:(NSString *)name error:(NSError **)error;
+ (BOOL)deleteBsonFromDiskName:(NSString *)name error:(NSError **)error;
+ (NSData *)readBsonName:(NSString *)name error:(NSError **)error;

+ (BOOL)writeObject:(id)object name:(NSString *)name error:(NSError **)error;
+ (id)objectWithName:(NSString *)name error:(NSError **)error;
+ (BOOL)deleteObjectWithName:(NSString *)name error:(NSError **)error;

@end
