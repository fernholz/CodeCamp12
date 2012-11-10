//
//  SDCViewController.m
//  SDC12
//
//  Created by Derek Fernholz on 10/15/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCViewController.h"

@interface SDCViewController ()

@end

@implementation SDCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        // code for 4-inch screen
        UIImage *background = [UIImage imageNamed: @"Default-568h@2x.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: background];
        imageView.frame = self.view.frame;
        
        [self.view addSubview: imageView];
    } else {
        // code for 3.5-inch screen
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
