#if TARGET_OS_PHONE || TARGET_IPHONE_SIMULATOR
//
//  UIImage+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/16/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSData+QSAdditions.h"

@interface UIImage (QSAdditions)

- (NSData *)pngRepresentation;
- (NSString *)base64Representation;

@end

#endif