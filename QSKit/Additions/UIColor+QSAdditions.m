#if TARGET_OS_PHONE || TARGET_IPHONE_SIMULATOR

//
//  UIColor+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "UIColor+QSAdditions.h"

@implementation UIColor (QSAdditions)

+ (UIColor *)rgbColorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:((CGFloat)red / 255.0) green:((CGFloat)green / 255.0) blue:((CGFloat)blue / 255.0) alpha:alpha];
}

@end

#endif
