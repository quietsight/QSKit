//
//  UIColor+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QSAdditions)

/** Returns an RGB Color
 
 
 */
+ (UIColor *)rgbColorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

@end
