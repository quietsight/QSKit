//
//  NSData+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "NSData+QSAdditions.h"

@implementation NSData (QSAdditions)

- (NSString *)base64Encode {
    const unsigned char * objRawData = [self bytes];
    char * objPointer;
    char * strResult;
    NSUInteger intLength = self.length;
    if (intLength == 0) return nil;
    strResult = (char *)calloc(((intLength + 2) / 3) * 4, sizeof(char));
    objPointer = strResult;
    while (intLength > 2) {
        *objPointer++ = QSbase64EncodingTable[objRawData[0] >> 2];
        *objPointer++ = QSbase64EncodingTable[((objRawData[0] & 0x03) << 4) + (objRawData[1] >> 4)];
        *objPointer++ = QSbase64EncodingTable[((objRawData[1] & 0x0f) << 2) + (objRawData[2] >> 6)];
        *objPointer++ = QSbase64EncodingTable[objRawData[2] & 0x3f];
        objRawData += 3;
        intLength -= 3; 
    }
    if (intLength != 0) {
        *objPointer++ = QSbase64EncodingTable[objRawData[0] >> 2];
        if (intLength > 1) {
            *objPointer++ = QSbase64EncodingTable[((objRawData[0] & 0x03) << 4) + (objRawData[1] >> 4)];
            *objPointer++ = QSbase64EncodingTable[(objRawData[1] & 0x0f) << 2];
            *objPointer++ = '=';
        } else {
            *objPointer++ = QSbase64EncodingTable[(objRawData[0] & 0x03) << 4];
            *objPointer++ = '=';
            *objPointer++ = '=';
        }
    }
    *objPointer = '\0';
    NSString *retVal = [[NSString alloc] initWithCString:strResult encoding:NSASCIIStringEncoding];
    free(strResult);
    return retVal;
}

- (id)json {
    return [QSObject parseJSON:self];
}

@end
