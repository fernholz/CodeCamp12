//
//  SDCSpeakerCell.h
//  SDC12
//
//  Created by Derek Fernholz on 10/18/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"

@interface SDCSpeakerCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *textLabel;
@property (nonatomic, strong) IBOutlet UIImageView *speakerImage;
@property (nonatomic, strong) IBOutlet UITextView *bio;
@property (nonatomic, strong) IBOutlet UILabel *twitterHandle;
@property (nonatomic, strong) IBOutlet UIButton *moreInfoButton;

@end
