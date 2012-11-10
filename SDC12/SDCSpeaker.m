//
//  SDCSpeaker.m
//  SDC12
//
//  Created by Derek Fernholz on 10/18/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCSpeaker.h"

@implementation SDCSpeaker

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.bio = dictionary[@"bio"];
        self.company = dictionary[@"company"];
        self.company_website = dictionary[@"company_website"];
        self.email = dictionary[@"email"];
        self.first_name = dictionary[@"first_name"];
        self.speakerId = dictionary[@"id"];
        self.last_name = dictionary[@"last_name"];
        self.photo = dictionary[@"photo"];
        self.resource_uri = dictionary[@"resource_uri"];
        self.session = dictionary[@"session"][0];
        self.slug = dictionary[@"slug"];
        self.twitter = dictionary[@"twitter"];
        self.website = dictionary[@"website"];
    }
    
    return self;
}

@end
