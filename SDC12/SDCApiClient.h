//
//  SDCApiClient.h
//  SDC12
//
//  Created by Derek Fernholz on 10/16/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "AFHTTPClient.h"

@interface SDCApiClient : AFHTTPClient

+ (id) sharedInstance;

@end
