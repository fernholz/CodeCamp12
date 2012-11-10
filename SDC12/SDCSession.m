//
//  SDCSession.m
//  SDC12
//
//  Created by Derek Fernholz on 10/16/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCSession.h"

@implementation SDCSession

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.abstract = dictionary[@"abstract"];
        self.room = dictionary[@"room"];
        self.time = dictionary[@"time"];
        self.speaker = dictionary[@"speaker"];
        
    }
    
    return self;
}

@end
