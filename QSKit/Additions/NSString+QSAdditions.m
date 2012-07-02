//
//  NSString+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "NSString+QSAdditions.h"
#import "NSData+QSAdditions.h"


@implementation NSString (QSAdditions)

- (NSString *)base64Encode {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64Encode];
}
- (NSData *)base64Decode {
    const char * objPointer = [self cStringUsingEncoding:NSASCIIStringEncoding];
    NSUInteger intLength = strlen(objPointer);
    int intCurrent;
    int i = 0, j = 0, k;
    unsigned char * objResult;
    objResult = calloc(intLength, sizeof(char));
    while ( ((intCurrent = *objPointer++) != '\0') && (intLength-- > 0) ) {
        if (intCurrent == '=') {
            if (*objPointer != '=' && ((i % 4) == 1)) {
                free(objResult);
                return nil;
            }
            continue;
        }
        intCurrent = QSbase64DecodingTable[intCurrent];
        if (intCurrent == -1) {
            continue;
        } else if (intCurrent == -2) {
            free(objResult);
            return nil;
        }
        switch (i % 4) {
            case 0:
                objResult[j] = intCurrent << 2;
                break;
                
            case 1:
                objResult[j++] |= intCurrent >> 4;
                objResult[j] = (intCurrent & 0x0f) << 4;
                break;
                
            case 2:
                objResult[j++] |= intCurrent >>2;
                objResult[j] = (intCurrent & 0x03) << 6;
                break;
                
            case 3:
                objResult[j++] |= intCurrent;
                break;
        }
        i++;
    }
    k = j;
    if (intCurrent == '=') {
        switch (i % 4) {
            case 1:
                free(objResult);
                return nil;
            case 2:
                k++;
            case 3:
                objResult[k] = 0;
        }
    }
    NSData * objData = [[NSData alloc] initWithBytes:objResult length:j];
    free(objResult);
    return objData;
}
- (NSString *)urlEncode {
    CFStringRef r = CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    NSString *urlString = (__bridge NSString *)r;
    CFRelease(r);
    return urlString;
}
- (id)json {
    return [QSObject parseJSON:self];
}

@end
