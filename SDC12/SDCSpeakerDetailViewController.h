//
//  SDCSpeakerDetailViewController.h
//  SDC12
//
//  Created by Derek Fernholz on 10/19/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCSpeaker.h"

@interface SDCSpeakerDetailViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) SDCSpeaker *speakerInfo;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UILabel *detailTitle;
@property (nonatomic, strong) IBOutlet UILabel *detailBio;
@property (nonatomic, strong) IBOutlet UILabel *sessionName;
@property (nonatomic, strong) IBOutlet UILabel *sessionAbstract;

@end
