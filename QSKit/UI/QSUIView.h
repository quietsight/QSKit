//
//  QSUIView.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/21/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^QSUIViewDrawRectBlock)(CGContextRef context, CGRect rect);

@interface QSUIView : UIView
@property (nonatomic, copy) QSUIViewDrawRectBlock drawingBlock;


@end
