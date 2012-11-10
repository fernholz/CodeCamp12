//
//  SDCApiClient.m
//  SDC12
//
//  Created by Derek Fernholz on 10/16/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCApiClient.h"
#import "AFNetworking.h"

#define SDCApiBaseURLString @"http://southdakotacodecamp.net/api/v1/"

@implementation SDCApiClient

+ (id)sharedInstance {
    static SDCApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[SDCApiClient alloc] initWithBaseURL:[NSURL URLWithString:SDCApiBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self setParameterEncoding:AFJSONParameterEncoding];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

@end
