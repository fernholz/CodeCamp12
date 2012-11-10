//
//  SDCSpeaker.h
//  SDC12
//
//  Created by Derek Fernholz on 10/18/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

/*
 {"bio": "Adam Barney is a lifelong computer nerd living in Lincoln, NE. He bought his first computer in the fourth grade (a Commodore 64), and has been figuring out how to bend these machines to his will ever since. He started programming professionally in 2000, picking up with the .NET Framework 1.1 a couple years later. In 2008, he co-founded and continues to lead the Lincoln .NET Users Group, which now puts on the annual Nebraska code Camp. By day, Adam is a senior consultant with Sogeti USA out of Omaha, NE.", 
 "company": "Sogeti USA", 
 "company_website": "", 
 "email": "cabarney@gmail.com",
 "first_name": "Adam", 
 "id": "10", 
 "last_name": "Barney", 
 "photo": "/media/images/speakers/Adam_Barney.jpg", 
 "resource_uri": "/api/v1/speaker/10/", 
 "session": ["/api/v1/session/3/"], 
 "slug": "adam-barney", 
 "twitter": "", 
 "website": ""}
 */

#import <Foundation/Foundation.h>

@interface SDCSpeaker : NSObject

@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *company_website;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *first_name;
@property (nonatomic, copy) NSString *speakerId;
@property (nonatomic, copy) NSString *last_name;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *resource_uri;
@property (nonatomic, copy) NSString *session;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *twitter;
@property (nonatomic, copy) NSString *website;


- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
