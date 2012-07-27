//
//  UIView+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "UIView+QSAdditions.h"

@implementation UIView (QSAdditions)

- (void)setFrameOrigin:(CGPoint)origin {
    self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
}
- (void)setFrameSize:(CGSize)size {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}
- (void)setFrameY:(CGFloat)y {
    [self setFrameOrigin:CGPointMake(self.frame.origin.x, y)];
}
- (void)setFrameX:(CGFloat)x {
    [self setFrameOrigin:CGPointMake(x, self.frame.origin.y)];
}
- (void)setFrameWidth:(CGFloat)width {
    [self setFrameSize:CGSizeMake(width, self.frame.size.height)];
}
- (void)setFrameHeight:(CGFloat)height {
    [self setFrameSize:CGSizeMake(self.frame.size.height, height)];
}

- (void)borderWithColor:(UIColor *)color width:(CGFloat)width {
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}

@end
