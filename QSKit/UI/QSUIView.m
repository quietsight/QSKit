//
//  QSUIView.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/21/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSUIView.h"

@implementation QSUIView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_drawingBlock) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        _drawingBlock(context, rect);
    }
}

@end
