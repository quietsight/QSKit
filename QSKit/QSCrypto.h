//
//  QSCrypto.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSObject.h"
#import <CommonCrypto/CommonDigest.h>

@interface QSCrypto : QSObject

+ (NSString *)sha1:(NSString *)input;
+ (NSString *)md5:(NSString *)input;


@end
