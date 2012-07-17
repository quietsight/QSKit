//
//  QSDataManager.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSDataManager.h"
#import "NSData+QSAdditions.h"
#import "NSString+QSAdditions.h"
#import "NSDictionary+QSAdditions.h"
#import "NSArray+QSAdditions.h"

@implementation QSDataManager

+ (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
+ (NSString *)filePathForFileName:(NSString *)fileName {
    return [[self documentsDirectory] stringByAppendingPathComponent:fileName];
}
+ (BOOL)fileExists:(NSString *)fileName {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self filePathForFileName:fileName]];
}
+ (NSString *)fileWithName:(NSString *)name error:(NSError *__autoreleasing *)error {
    return [NSString stringWithContentsOfFile:[self filePathForFileName:name] encoding:NSUTF8StringEncoding error:error];
}
+ (BOOL)deleteFileNamed:(NSString *)fileName error:(NSError *__autoreleasing *)error {
    NSString *documentPath = [self filePathForFileName:fileName];
    [[NSFileManager defaultManager] removeItemAtPath:documentPath error:error];
    if (error != nil) {
        return NO;
    }
    return YES;
}


+ (BOOL)writeBsonToDisk:(NSData *)data name:(NSString *)name error:(NSError *__autoreleasing *)error {
    NSString *base64 = [data base64Encode];
    NSString *filePath = [self filePathForFileName:[NSString stringWithFormat:@"%@.%@",name,QS_DATA_MANAGER_BSON_EXT]];
    [base64 writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:error];
    if (error != nil) {
        return NO;
    }
    return YES;
}
+ (BOOL)deleteBsonFromDiskName:(NSString *)name error:(NSError *__autoreleasing *)error {
    if ([self fileExists:[NSString stringWithFormat:@"%@.%@",name,QS_DATA_MANAGER_BSON_EXT]]) {
        [self deleteFileNamed:[NSString stringWithFormat:@"%@.%@",name,QS_DATA_MANAGER_BSON_EXT] error:error];
    } else {
        NSError *__autoreleasing n_error = [NSError errorWithDomain:@"com.quietsight.datamanager" code:999 userInfo:nil];
        error =  &n_error;
    }
    if (error != nil) {
        return NO;
    }
    return YES;
}
+ (NSData *)readBsonName:(NSString *)name error:(NSError *__autoreleasing *)error {
    NSString *file = [NSString stringWithFormat:@"%@.%@",name,QS_DATA_MANAGER_BSON_EXT];
    NSString *dataString = [self fileWithName:file error:error];
    return [dataString base64Decode];
}


+ (BOOL)writeObject:(id)object name:(NSString *)name error:(NSError **)error {
    [self writeBsonToDisk:[object binaryJson] name:name error:error];
    if (error != nil) {
        return NO;
    }
    return YES;
}
+ (id)objectWithName:(NSString *)name error:(NSError **)error {
    return [[self readBsonName:name error:error] json];
}
+ (BOOL)deleteObjectWithName:(NSString *)name error:(NSError **)error {
    [self deleteBsonFromDiskName:name error:error];
    if (error != nil) {
        return NO;
    }
    return YES;
}

@end
