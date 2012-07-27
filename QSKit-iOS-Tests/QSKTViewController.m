//
//  QSKTViewController.m
//  QSKit-iOS-Tests
//
//  Created by Skylar Schipper on 7/22/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSKTViewController.h"

@interface QSKTViewController ()

@end

@implementation QSKTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [v borderWithColor:[UIColor orangeColor] width:3];
    [self.view addSubview:v];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
