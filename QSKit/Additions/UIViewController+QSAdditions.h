//
//  UIViewController+QSAdditions.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController (QSAdditions)

/** Resigns the first responder
 
 Resign the first responder for the passed object
 */
- (IBAction)senderResignFirstResponder:(id)sender;

/** Dismiss Modals for self
 
 Dismisses modal view controller animated.
 */
- (IBAction)dismissModal:(id)sender;

@end
