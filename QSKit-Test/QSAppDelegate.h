//
//  QSAppDelegate.h
//  QSKit-Test
//
//  Created by Skylar Schipper on 7/2/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSNetworkRequest.h"


@class QSViewController;

@interface QSAppDelegate : UIResponder <UIApplicationDelegate, SSNetworkRequestDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) QSViewController *viewController;

@end
