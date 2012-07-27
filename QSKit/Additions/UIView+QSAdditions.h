//
//  UIView+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (QSAdditions)

/** Set the frame origin 
 
 */
- (void)setFrameOrigin:(CGPoint)origin;

/** Set the size of the frame without affecting origin
 
 */
- (void)setFrameSize:(CGSize)size;

/** Set the frame Y
 
 */
- (void)setFrameY:(CGFloat)y;

/** Set the frame X
 
 */
- (void)setFrameX:(CGFloat)x;

/** Set frame Width
 
 */
- (void)setFrameWidth:(CGFloat)width;

/** Set frame Height
 
 */
- (void)setFrameHeight:(CGFloat)height;


- (void)borderWithColor:(UIColor *)color width:(CGFloat)width;

@end
