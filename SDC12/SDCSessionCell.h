//
//  SDCSessionCell.h
//  SDC12
//
//  Created by Derek Fernholz on 10/16/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDCSessionCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *textLabel;
@property (nonatomic, strong) IBOutlet UILabel *metaLabel;
@property (nonatomic, strong) IBOutlet UILabel *detailTextLabel;

@end
