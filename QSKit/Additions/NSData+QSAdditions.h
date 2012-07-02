//
//  NSData+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSObject.h"
#import "QSKit_Helper.h"


@interface NSData (QSAdditions)

- (NSString *)base64Encode;

- (id)json;

@end
