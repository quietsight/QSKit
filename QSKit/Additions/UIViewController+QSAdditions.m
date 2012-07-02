//
//  UIViewController+QSAdditions.m
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "UIViewController+QSAdditions.h"

@implementation UIViewController (QSAdditions)

- (void)senderResignFirstResponder:(id)sender {
    [sender resignFirstResponder];
}
- (void)dismissModal:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
